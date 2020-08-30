class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, foreign_key: 'author_id', class_name: 'Test'

  validates :email, presence: true

  def tests_by_level(level)
    tests.where(level: level.to_i)
  end
end
