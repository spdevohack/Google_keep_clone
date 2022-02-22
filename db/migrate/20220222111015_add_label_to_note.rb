class AddLabelToNote < ActiveRecord::Migration[7.0]
  def change
    remove_column :notes, :description
    add_column :notes, :label_title, :string
  end
end
