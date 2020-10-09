class Badge < ApplicationRecord
  has_many :users, through: :users_badges

  validates :name, :image, :description, :rule, :rule_arg, presence: true
end
