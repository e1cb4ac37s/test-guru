class Badge < ApplicationRecord
  validates :name, :image, :description, presence: true
end
