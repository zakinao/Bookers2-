class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, length: {minimum: 2, maximum: 20}
  validates :name, uniqueness: true
  validates :introduction, length: {maximum: 50}
  attachment :profile_image
  has_many :books, dependent: :destroy

end
