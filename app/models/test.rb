class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :users_tests, dependent: :destroy
  has_many :users, through: :users_tests
end
