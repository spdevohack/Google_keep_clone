class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.text :description
      t.belongs_to :notebook
      t.timestamps
    end
  end
end
