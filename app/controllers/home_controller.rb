class HomeController < ApplicationController

  def index
    @banners = Banner.all
    @charities = Charity.featured
    get_default_charity
  end

  def brand
  end


  def faq
    @questions = Question.all
    @questions_categories = QuestionsCategory.all

  end

  def client_spotlight
    @client_spotlights = ClientSpotlight.all
  end


  def how_it_works
    @page_content = Page.find_by_page_name('how_it_works').page_content
  end

  def top_ten_reasons
    @page_content = Page.find_by_page_name('top_ten_reasons').page_content
  end

  def share_contest
    @charities = Charity.find(:all, :limit => 10)
  end

  def send_email
    if params[:answer].present? && params[:answer] == "8" && params[:email].present? && params[:email].match(/\A[^@]+@[^@]+\z/)
      ObsMailer.send_inquiry(params).deliver
      render :json => {:success => true}.to_json
    else
      @errors = []
      @errors << "Please enter the correct answer." if !params[:answer].present? || !params[:answer] == "8"
      @errors << "Please enter the email address." if !params[:email].present?
      @errors << "Please enter the valid email address." if !params[:email].match(/\A[^@]+@[^@]+\z/)
      render :json => {:success => false, :html => render_to_string(:partial => "/orders/form_errors")}.to_json
    end
  end

  def ccc
    @page_content = Page.find_by_page_name('ccc').page_content
    render :layout => false
  end

  def download
    send_file 'public/OneBillionShirts_MediaKit.pdf', :type => "application/pdf", :x_sendfile => true
  end

  def calculated_value_popup
    get_default_charity
    nmbr_of_shirts = params[:number_of_shirts]
    if nmbr_of_shirts
      if nmbr_of_shirts.to_i >= 24 && nmbr_of_shirts.to_i <= 47
        @price = 5.65
        @compared_price = "$7.45 - $9.00"
      elsif nmbr_of_shirts.to_i >= 48 && nmbr_of_shirts.to_i <= 71
        @price = 4.99
        @compared_price = "$6.94 - $8.79"
      elsif nmbr_of_shirts.to_i >= 72 && nmbr_of_shirts.to_i <= 143
        @price = 4.25
        @compared_price = "$5.73 - $7.12"
      elsif nmbr_of_shirts.to_i >= 144 && nmbr_of_shirts.to_i <= 249
        @price = 3.95
        @compared_price = "$5.01 - $6.95"
      elsif nmbr_of_shirts.to_i >= 250 && nmbr_of_shirts.to_i <= 499
        @price = 3.80
        @compared_price = "$4.80 - $6.52"
      elsif nmbr_of_shirts.to_i >= 500 && nmbr_of_shirts.to_i <= 999
        @price = 3.45
        @compared_price = "$4.45 - $5.90"
      elsif nmbr_of_shirts.to_i >= 1000 && nmbr_of_shirts.to_i <= 1999
        @price = 3.20
        @compared_price = "$4.22 - $5.55"
      elsif nmbr_of_shirts.to_i >= 2000 && nmbr_of_shirts.to_i <= 4999
        @price = 3.10
        @compared_price = "$4.10 - $5.19"
      elsif nmbr_of_shirts.to_i >= 5000
        @price = 2.90
        @compared_price = "$3.90 - $4.90"
      end
    end
    @donation = ((0.25)*(params[:number_of_shirts].to_f))
    #render :json => {:html => render_to_string(:partial => "/home/calculated_value_popup")}.to_json
    render :partial => "/home/calculated_value_popup"
  end

  def view_all_charities
    @charities = Charity.all
    render :partial => "home/view_all_charities"

  end

  def get_questions
    @question_category = QuestionsCategory.find(params[:category_id])
    render :partial => "home/category_questions", :locals => {:questions_category => @question_category}
  end

  private
  def get_default_charity
    @default_charity = Charity.find_by_is_default(true)
    if @default_charity.blank?
      @default_charity = Charity.first
    end
  end

  def thank_you

  end

end
