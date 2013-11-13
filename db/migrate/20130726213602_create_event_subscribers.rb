class CreateEventSubscribers < ActiveRecord::Migration
  def change
    create_table :event_subscribers do |t|
      t.string :email
      t.string :zip

      t.timestamps
    end
  end
end
