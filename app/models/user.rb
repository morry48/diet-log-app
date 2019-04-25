class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :email, presence: true
  validates :nickname, presence: true

  has_many :logs
<<<<<<< Updated upstream
  has_many :user_wights
=======
  has_many :weight_logs
>>>>>>> Stashed changes
  has_one_attached :avatar
end
