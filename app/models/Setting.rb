class Setting < ActiveRecord::Base
  attr_accessible :key, :value, :icon

  has_attached_file :icon, :styles => { :thumb => ["80x80^"] }

  class << self

    def get_value key
      result = ""
        item = find_by_key(key).try(:reload)
        if key == 'first_icon' || key == 'second_icon' || key == 'third_icon' || key == 'fourth_icon'
          result = item.try(:icon)
        else
          result = item.try(:value)
        end
      result
    end
  end
end
