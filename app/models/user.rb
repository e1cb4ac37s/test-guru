require_relative './validators/email_validator'

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, foreign_key: 'author_id', class_name: 'Test'

  validates :email, presence: true, uniqueness: true, email: true

  has_secure_password

  def tests_by_level(level)
    tests.where(level: level.to_i)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
