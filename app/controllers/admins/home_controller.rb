class Admins::HomeController < ApplicationController

  layout "admin"

  before_filter :authenticate_admin!

end
