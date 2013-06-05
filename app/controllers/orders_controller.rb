class OrdersController < ApplicationController

  def order_process
    @charity = Charity.find_by_id(params[:charity_id])
    @shirt_options = ShirtOption.all
    @shirt_sub_options = ShirtSubOption.all
  end

  def quick_quote
    @charities = Charity.all
    @shirt_options = ShirtOption.all
    @shirt_sub_options = ShirtSubOption.all
  end

  def form_2
    make_all_variables_nil
    $charity_id = params[:charity_id]
    $arr = []
    @shirt_colors = ShirtColor.all
    if params[:quantity].present? && params[:shirt_option_id].present?
      $arr = [params[:quantity], params[:shirt_option_id], params[:shirt_sub_option_id], params[:other_shirt_option]]
      render :json => {:success => true, :html => render_to_string(:partial => "/orders/form_2")}.to_json
    else
      @errors = []
      @errors << "Please add quantity." unless params[:quantity].present?
      @errors << "Please select at least one shirt option." unless params[:shirt_option_id].present?
      render :json => {:success => false, :html => render_to_string(:partial => "/orders/form_errors")}.to_json
    end
  end

  def form_3
    #@order = Order.find_by_id(params[:id])
    @size_categories = SizeCategory.all
    @size_options = SizeOption.all
    if params[:shirt_color_id].present?
      $arr << params[:shirt_color_id]
      render :json => {:success => true, :html => render_to_string(:partial => "/orders/form_3")}.to_json
    elsif params[:shirt_color_name].present?
      $arr << nil
      $color_name = params[:shirt_color_name]
      render :json => {:success => true, :html => render_to_string(:partial => "/orders/form_3")}.to_json
    else
      @errors = []
      @errors << "Please select at least one Shirt Color."
      render :json => {:success => false, :html => render_to_string(:partial => "/orders/form_errors")}.to_json
    end

  end

  def form_4
    @size_categories = SizeCategory.all
    @size_options = SizeOption.all
    $arr << params[:estimated_total_shirts]
    $size_details = params
    @back_ink_color_options = InkColorOption.back_options
    @front_ink_color_options = InkColorOption.front_options
    render :json => {:success => true, :html => render_to_string(:partial => "/orders/form_4")}.to_json
  end

  def form_5
    @client = Client.new
    if params[:ink_color_option_ids].present?
      $arr << params[:instructions]
      $ink_color_option_ids = params[:ink_color_option_ids]
      $art_file_front = params[:art_file_front] if params[:art_file_front].present?
      $art_file_back = params[:art_file_back] if params[:art_file_back].present?
      render :text => render_to_string(:partial => "/orders/form_5")
    else
      @errors = []
      @errors << "Please select ink color options." unless params[:ink_color_option_ids].present?
      render :text => render_to_string(:partial => "/orders/form_errors"), :status => 420
    end
  end

  def save_order
    @order = Order.create!(:charity_id => $charity_id, :quantity => $arr[0],
                           :shirt_option_id => $arr[1], :shirt_sub_option_id => $arr[2],
                           :other_shirt_option => $arr[3],
                           :shirt_color_id => $arr[4], :estimated_total_shirts => $arr[5],
    )
    if @order.save
      @size_categories = SizeCategory.all
      @size_options = SizeOption.all
      @size_categories.each do |siz_category|
        @size_options.each do |size_option|
          $size_details.each do |size_dtl|
            if "#{siz_category.id}_#{size_option.id}_values" == size_dtl[0]
              OrderSizeValue.create!(:order_id => @order.id, :size_category_id => siz_category.id, :size_option_id => size_option.id, :value => size_dtl[1][0])
            end
          end if $size_details.present?
        end if @size_options.present?
      end if @size_categories.present?
      OrderFile.create!(:order_id => @order.id, :side => "front", :image => $art_file_front) if $art_file_front.present?
      OrderFile.create!(:order_id => @order.id, :side => "back", :image => $art_file_back) if $art_file_back.present?
      @order.update_attributes!(:instructions => $arr[6], :shirt_color_name => $color_name)
      $ink_color_option_ids.each do |id|
        @order.ink_color_options << InkColorOption.find_by_id(id) if InkColorOption.find_by_id(id).present?
      end
    end
    @client = @client = Client.new(params[:client])
    if @client.save
      @order.update_attributes(:client_id => @client.id, :deadline => params[:deadline])
      ObsMailer.order_complete(@order).deliver
      render :json => {:success => true}.to_json
    else
      @errors = []
      @client.errors.full_messages.each do |msg|
        @errors << msg
      end
      render :json => {:success => false, :html => render_to_string(:partial => "/orders/form_errors")}.to_json
    end
  end

  def generate_pdf
    @charity = Charity.find_by_id(params[:id])
    pdf = WickedPdf.new.pdf_from_string(
        render_to_string(:template => '/orders/certificate.html.erb', :layout => '/layouts/pdf'))
    save_path = Rails.root.join('doc', 'certificate.pdf')
    File.open(save_path, 'wb') do |file|
      file << pdf
    end
    send_file "#{Rails.root}/doc/certificate.pdf"
    File.delete("#{Rails.root}/doc/certificate.pdf")
  end

  def thank_you

  end

  def save_new_color
    new_color = ShirtColor.create(:code => params[:code])
    @shirt_colors = ShirtColor.all
    render :partial => 'orders/color_boxes_list', :layout => false
  end

  private
  def make_all_variables_nil
    $arr = nil
    $size_details = nil
    $ink_color_option_ids = nil
    $art_file_front = nil
    $art_file_back = nil
    $color_name = nil
  end

end
