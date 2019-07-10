class CreateEventsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :events_users, id: false do |t|
      t.references :event, foreign_Key: true
      t.references :user, foreign_Key: true

      t.timestamps
    end
  end
end
