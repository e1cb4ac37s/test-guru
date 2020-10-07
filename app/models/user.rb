class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :trackable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, foreign_key: 'author_id', class_name: 'Test'
  has_many :users_badges, dependent: :destroy
  has_many :badges, through: :users_badges

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def tests_by_level(level)
    tests.where(level: level.to_i)
  end

  def tests_by_category(category)
    tests.where(category_id: category.id)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
