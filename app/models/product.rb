class Product < ApplicationRecord

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :brand
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :size
  belongs_to_active_hash :delivery_time
  belongs_to_active_hash :time


end
