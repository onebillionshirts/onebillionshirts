class HomeController < ApplicationController
  include ActionView::Helpers::NumberHelper

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
    render layout: nil
  end

  def client_spotlight
    @client_spotlights = ClientSpotlight.all
  end

  def client_slight
    @client_spotlights = ClientSpotlight.find(params[:id])
  end


  def how_it_works
    @page_content = Page.find_by_page_name('how_it_works').page_content
    render layout: nil
  end

  def participate
    @page_content = Page.find_by_page_name('Participate').page_content
  end

  def top_ten_reasons
    @page_content = Page.find_by_page_name('top_ten_reasons').page_content
  end

  def share_contest
    @charities = Charity.find(:all, :limit => 10)
    render layout: nil
  end

  def send_email
    if params[:answer].present? && params[:answer] == "8" && params[:email].present? && params[:email].match(/\A[^@]+@[^@]+\z/)
      ObsMailer.send_inquiry(params).deliver
      render :json => {:success => true}.to_json
    else
      @errors = []
      @errors << "Please enter the correct answer.<br>" if !params[:answer].present? || !params[:answer] == "8"
      @errors << "Please enter the email address.<br>" if !params[:email].present?
      @errors << "Please enter the valid email address.<br>" if !params[:email].match(/\A[^@]+@[^@]+\z/)
      @errors << "Please enter the name.<br>" if !params[:name].present?
      @errors << "Please enter the any inquiry." if !params[:inquiry].present?
      render :json => {:success => false, html: @errors}.to_json
    end
  end

  def ccc
    @page_content = Page.find_by_page_name('ccc').page_content
    render :layout => false
  end

  def download
    send_file "#{Rails.root}/public/OneBillionShirts_Media_Kit.pdf", :type => "application/pdf", :x_sendfile => true
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

  def our_story
    render layout: nil
  end

  def view_all_charities
    @charities = Charity.all
    render :partial => "home/view_all_charities"

  end

  def get_questions
    @question_category = QuestionsCategory.find(params[:category_id])
    render :partial => "home/category_questions", :locals => {:questions_category => @question_category}
  end

   def calendar
    @events = Event.all
    @event =  Event.new
    @sub =  EventSubscriber.new
   end

  def impact

  end

  def calculate_impact
    @email = params[:email].to_i * 0.1
    @fb = params[:fb].to_i * 0.05
    @tw = params[:twitter].to_i * 0.04
    @emp = params[:emp].to_i  * 10 * 0.15
    @total_o = @email + @fb + @tw + @emp
    @total_s = @total_o.to_i * 144
    @total_m = (@total_s.to_i * 25) / 100
    @para = (@total_s.to_i * 0.03) * 144
    @charities = Charity.all

    @total_m = number_to_currency @total_m.to_i
    @para = number_with_delimiter @para.to_i
    @total_s = number_with_delimiter @total_s.to_i
    #render json: {params: params, email: @email, fb: @fb, tw: @tw, emp: @emp, order: @total_o, shirts: @total_s, money: @total_m, para: @para.to_i  }
  end

  def socialize
    render layout: nil
  end

  def channel
    @src = "//connect.facebook.net/en_US/all.js"
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
