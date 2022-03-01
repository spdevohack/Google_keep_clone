class Notebook < ApplicationRecord
	belongs_to :user
	has_many :notes, dependent: :destroy	
  mount_uploader :image, ImageUploader

  def self.notes_empty
    Notebook.where(title: " ").where(description: " ").where(date: nil).where(time: nil).where(image: nil)
  end
end
