class CreateSignups < ActiveRecord::Migration[8.1]
  def change
    create_table :signups do |t|
      t.references :attendee, null: false, foreign_key: { to_table: :user }
      t.references :attended_event, null: false, foreign_key: { to_table: :event }

      t.timestamps
    end
  end
end
