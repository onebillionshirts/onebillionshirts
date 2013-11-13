class Logo < CharityImage

  before_create :check_logo

  def check_logo
    self.image = File.new("app/assets/images/no_logo.jpg") unless image.present?
  end

end
