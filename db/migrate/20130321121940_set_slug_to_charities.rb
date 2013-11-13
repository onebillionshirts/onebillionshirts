class SetSlugToCharities < ActiveRecord::Migration
  def up
    Charity.find_each(&:save)
  end

  def down
  end
end
