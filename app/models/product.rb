class Product < ApplicationRecord
  # has_one_attached :image
  has_many :images, dependent: :destroy
end
