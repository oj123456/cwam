class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def fill_seo(title, description, keywords, image)
    image = 'images/missing.png' if image.empty?
    @seo_data = {
        title: title,
        description: description,
        keywords: keywords,
        image: "#{root_url(:only_path => false)}#{image}",
        url: request.original_url
    }
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    end
end
