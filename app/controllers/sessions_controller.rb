# encoding: utf-8
class SessionsController < Devise::SessionsController
  respond_to :html, :json
  def create
    resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")

    sign_in_and_redirect(resource_name, resource)
  end

  def sign_in_and_redirect(resource_or_scope, resource = nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    respond_to do |format|
      @success = true
      if current_user.role? :super_admin
        format.html {redirect_to admin_dashboard_path}
      else
        format.html {redirect_to session.has_key?(:return_url) ? session.delete(:return_url) : root_path}
      end
    end
  end

  def failure
    respond_to do |format|
      @success = false
      format.html {redirect_to session.has_key?(:return_url) ? session.delete(:return_url) : root_path}
    end
  end

  def return_after_signin
    session[:return_url] = params[:return_url].present? ? params[:return_url] : nil
    @link = params[:link]
    respond_to do |format|
      format.js
    end
  end
end
