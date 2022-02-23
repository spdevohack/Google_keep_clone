class AddBinDate < ActiveRecord::Migration[7.0]
  def change
    add_column :notebooks, :note_bin, :date
  end
end
