class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :area_id, :city, :house_number, :building, :tel, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :tel, format: { with: /\A\d{10,11}\z/, message: 'is invalid'}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, area_id: area_id, city: city, house_number: house_number, building: building, tel: tel, order_id: order.id)
  end  
end

