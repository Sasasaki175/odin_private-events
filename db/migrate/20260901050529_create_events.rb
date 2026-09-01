class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.date :starts_on
      t.string :location

      t.timestamps
    end
  end
end
