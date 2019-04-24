class UserWight < ApplicationRecord
  belongs_to :user
  validates :wight, presence: true
end
