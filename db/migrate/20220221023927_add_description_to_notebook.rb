class AddDescriptionToNotebook < ActiveRecord::Migration[7.0]
  def change
    add_column :notebooks, :description, :text
  end
end
