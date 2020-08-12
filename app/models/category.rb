class Category < ApplicationRecord
  default_scope { order(:title) }
end
