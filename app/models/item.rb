class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_many_attached :images

  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :schedule_delivery

  with_options presence: true do
    validates :name
    validates :description
    validates :price
  end

  validates :images, length: { minimum: 1, maximum: 5, message: 'は1枚以上5枚以下にしてください' }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :schedule_delivery_id
  end

  validates :price, presence: true
  validates :price, numericality: { only_integer: true, message: 'must be half-width numbers' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
