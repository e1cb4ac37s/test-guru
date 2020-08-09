class User < ApplicationRecord
  has_many :users_tests, dependent: :destroy
  has_many :tests, through: :users_tests

  def tests_by_level(level)
    tests.where(level: level.to_i)
  end
end
