class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :users_tests, dependent: :destroy
  has_many :users, through: :users_tests

  def self.by_category_title(category_title)
    joins(:category).where(categories: {title: category_title}).order(id: :desc).pluck(:title)
  end
end
