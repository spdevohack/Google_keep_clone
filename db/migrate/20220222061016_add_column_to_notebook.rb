class AddColumnToNotebook < ActiveRecord::Migration[7.0]
  def change
    add_column :notebooks, :pinned, :boolean, default: false
    add_column :notebooks, :date, :date
    add_column :notebooks, :time, :time
    add_column :notebooks, :image, :string
  end
end
