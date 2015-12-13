# encoding: utf-8
class PasswordsController < Devise::PasswordsController
# POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      flash[:notice] = "Successfully sent a mail in your email address #{resource.email}. Please check your mail"
      redirect_to root_path
    else
      respond_with(resource)
    end
  end
end
