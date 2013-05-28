class Admins::SessionsController < Devise::SessionsController

  layout "admin"

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_with resource, :location => admins_banners_url
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out && is_navigational_format?
    respond_to do |format|
      format.any(*navigational_formats) { redirect_to sign_in_path }
      format.all do
        head :no_content
      end
    end
  end

end