#encoding: utf-8

class AddBasicSettings < ActiveRecord::Migration

  def up
  	Setting.create :key => "first_icon", :value => ""
    Setting.create :key => "second_icon", :value => ""
    Setting.create :key => "third_icon", :value => ""
    Setting.create :key => "fourth_icon", :value => ""

    Setting.create :key => "first_text", :value => "Toys for a homeless child’s birthday party!"
    Setting.create :key => "second_text", :value => "Refugees provided with clean drinking water for a month."
    Setting.create :key => "third_text", :value => "Meals provided to hungry American children."
    Setting.create :key => "fourth_text", :value => "Homeless animals find a place to call home."

    Setting.create :key => "first_link", :value => "Birthday Wishes"
    Setting.create :key => "second_link", :value => "Waterproject.com"
    Setting.create :key => "third_link", :value => "Share Our Strength"
    Setting.create :key => "fourth_link", :value => "ASPCA"

    Setting.create :key => "first_algorithm", :value => "0.25 / 3"
    Setting.create :key => "second_algorithm", :value => "0.25 * 2.6"
    Setting.create :key => "third_algorithm", :value => "0.25 * 10"
    Setting.create :key => "fourth_algorithm", :value => "0.25 / 0.6"
  end

  def down
  	Setting.destroy_all :key => 'first_icon'
  	Setting.destroy_all :key => 'second_icon'
  	Setting.destroy_all :key => 'third_icon'
  	Setting.destroy_all :key => 'fourth_icon'

  	Setting.destroy_all :key => 'first_text'
  	Setting.destroy_all :key => 'second_text'
  	Setting.destroy_all :key => 'third_text'
  	Setting.destroy_all :key => 'fourth_text'

  	Setting.destroy_all :key => 'first_link'
  	Setting.destroy_all :key => 'second_link'
  	Setting.destroy_all :key => 'third_link'
  	Setting.destroy_all :key => 'fourth_link'

  	Setting.destroy_all :key => 'first_algorithm'
  	Setting.destroy_all :key => 'second_algorithm'
  	Setting.destroy_all :key => 'third_algorithm'
  	Setting.destroy_all :key => 'fourth_algorithm'
  end
end
