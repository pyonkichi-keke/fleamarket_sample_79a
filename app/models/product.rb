class Product < ApplicationRecord

  has_many :images, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

end
