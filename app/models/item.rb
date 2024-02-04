class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :area
  belongs_to :shipping_to_date
  belongs_to :user
  has_one_attached :image
  has_one :order


  validates :item_name, :content, :category_id, :condition_id, :shipping_fee_id, :area_id, :shipping_to_date_id, :price, :image, presence: true
  validates :category_id, :condition_id, :shipping_fee_id, :area_id, :shipping_to_date_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

end
