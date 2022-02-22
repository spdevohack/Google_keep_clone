class User < ApplicationRecord


  has_many :notebooks, dependent: :destroy
  has_many :notes, through: :notebooks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
