class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :email, presence: true
  validates :nickname, presence: true

  has_many :logs
  has_one_attached :avatar
end
