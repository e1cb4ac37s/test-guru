class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :users_tests, dependent: :destroy
  has_many :users, through: :users_tests

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category_title, -> (category_title) { joins(:category).where(categories: {title: category_title}).order(id: :desc).pluck(:title) }
end
