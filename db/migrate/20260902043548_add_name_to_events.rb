class AddNameToEvents < ActiveRecord::Migration[8.1]
  def change
    add_column :Events, :name, :string
  end
end
