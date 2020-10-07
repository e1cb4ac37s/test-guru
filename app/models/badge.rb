class Badge < ApplicationRecord
  has_many :users, through: :users_badges

  validates :name, :image, :description, presence: true
end
