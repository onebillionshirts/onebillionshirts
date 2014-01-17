class Admins::SettingsController < Admins::HomeController

  def index
    @settings = Setting.order('created_at ASC')
  end

  def edit
    @setting = Setting.find params[:id]
  end

  def update
    @setting = Setting.find params[:id]
    if @setting.update_attributes params[:setting]
      redirect_to admins_settings_path
    else
      render :edit
    end
  end
  
end
