class User < ApplicationRecord
  has_many :users_tests, dependent: :destroy
  has_many :tests, through: :users_tests
  has_many :created_tests, foreign_key: 'author_id', class_name: 'Test'

  validates :email, presence: true

  def tests_by_level(level)
    tests.where(level: level.to_i)
  end
end
