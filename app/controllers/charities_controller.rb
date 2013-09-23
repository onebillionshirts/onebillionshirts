class CharitiesController < ApplicationController

  layout "charity"

  def index
    $search_key= nil
    cookies[:key] = nil
    $get_key = "featured"
    @charities = Charity.featured
  end

  def get_charities
    $search_key = nil
    $get_key = params[:key]
    if params[:key] == "causes"
      @causes = CharityCategory.all
      render :partial => "/charities/categories_list"
      #render :json => {:html => render_to_string(:partial => "/charities/categories_list")}.to_json
    else
      @charities = get_all_charities(params[:key])
      render :partial => "/charities/list"
      #render :json => {:html => render_to_string(:partial => "/charities/list")}.to_json
    end

  end

  def sort_charities
    if $get_key.present?
      @charities = get_all_charities($get_key)
    elsif $search_key.present?
      @charities = search_all_charities($search_key)
    end
    if $order == "DESC"
      @charities = @charities.sort_by { |charity| charity["#{params[:sort_key]}"] }.reverse
      $order = "ASC"
    else
      $order = "DESC"
      @charities = @charities.sort_by { |charity| charity["#{params[:sort_key]}"] }
    end
    render :json => {:html => render_to_string(:partial => "/charities/list")}.to_json
  end

  def search_charities
    $get_key = nil
    $search_key = params[:search_key]
    @charities = search_all_charities(params[:search_key])
    render :json => {:html => render_to_string(:partial => "/charities/list")}.to_json
  end

  def show
    @get_key = cookies[:key]
    @charity = Charity.find_by_slug(params[:id])
  end

  def request_quote
    @charity = Charity.find_by_id(params[:id])
    render :json => {:html => render_to_string(:partial => "/charities/request_quote")}.to_json
  end

  def new
    @charity = Charity.new
    @charity_categories = CharityCategory.all
  end

  def add_charity
    @charity = Charity.new(params[:charity])
    @charity.approved = false
    if @charity.save
      flash[:notice] = 'Charity was successfully created.'
      redirect_to charities_url
    else
      flash[:notice] = 'Charity not created.'
      @charity_categories = CharityCategory.all
      render :action => :new
    end
  end

  def image_form
    render :json => {:html => render_to_string(:partial => "/charities/image_form")}.to_json
  end

  def suggest_charity
    @suggested_site = SuggestedCharity.create(:url => params[:website_url])
    flash[:notice] = "Thanks for suggesting us new Charity."
    render :partial => "charities/suggest_charity", :layout => false
  end

  def count_share
    @charity.find(params[:charity_id])
    #count = @charity.share_count.to_i
    #@charity.update_attribute(:share_count, count+1)
  end

  private

  def get_all_charities(key)
    case key
      when "featured"
        Charity.order("name ASC").featured
      when "all"
        Charity.order("name ASC").all
      when "recent"
        Charity.order("created_at DESC").all
      when "top_ten"
        Charity.top_ten
      else
        Charity.find_all_by_charity_category_id(key)
      #category = CharityCategory.find_by_id(key)
      #category.charities if category.present?
    end
  end

  def search_all_charities(key)
    Charity.where("name like ? OR city like ? OR state like ? OR address like ?", "%#{key}%", "%#{key}%", "%#{key}%", "%#{key}%") if key.present?
  end


end
