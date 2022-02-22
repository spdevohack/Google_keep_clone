class Notebook < ApplicationRecord
	belongs_to :user
	has_many :notes, dependent: :destroy	
  mount_uploader :image, ImageUploader
end
