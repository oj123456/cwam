class AboutController < ApplicationController
  def index
    page_seo = SeoData.where(page: SeoData.pages[:about]).first
    @page_title = page_seo.title
    fill_seo(page_seo.title, page_seo.description, page_seo.keywords, page_seo.image.url)
  end

  def submit_contact
    if(!params[:authenticity_token])
      return render json: {code: -1, message: 'There was an error while submitting your form !'}
    end

    fn = params[:first_name]
    ln = params[:last_name]
    email = params[:email]
    pn = params[:phone_number]
    subject = params[:subject]
    message = params[:message]
    newsletter = params[:newsletter]

    if fn.empty? || ln.empty? || email.empty? || pn.empty? || subject.empty? || message.empty?
      return render json: {code: -1, message: 'Please fill all the form\'s fields !'}
    end

    if newsletter == "1"
      add_mail_to_mailchimp(email)
    end

    GeneralMailer.contact_email(fn, ln, email, pn, subject, message).deliver_now

    render json: {code: 1, message: 'Your form has been submitted !'}
  end

  def subscribe_newsletter
    if(!params[:email] || params[:email].empty?)
      return render json: {code: -1, message: 'You must enter an email !'}
    end

    code, message = add_mail_to_mailchimp(params[:email])
    return render json: {code: code, message: message }
  end

  private
  def add_mail_to_mailchimp(email)
    begin
      mailchimp = Mailchimp::API.new(SETTINGS[:mailchimp][:api_key])
      mailchimp.lists.subscribe(SETTINGS[:mailchimp][:list_id], { "email" => email })
      return 1, "You have been added to our newsletter !"
    rescue => e
      return 0, e.message
    end
  end
end
