class GeneralMailer < ApplicationMailer

  def contact_email(first_name, last_name, email, phone_number, subject, message)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone_number = phone_number
    @subject = subject
    @message = message

    email = SETTINGS[:send_to]
    msg = mail(to: email, subject: "New contact from website") do |format|
      format.html(:content_type => "text/html", :charset => "UTF-8", :content_transfer_encoding => "7bit", layout: 'mailer' )
    end
  end

end
