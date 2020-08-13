class Category < ApplicationRecord
  default_scope { order(:title) }

  validates :title, presence: true
end
