class PurchaseAddress
  include ActiveModel::Model
 
  attr_accessor :postal_code, :prefectures_id, :municipalities, :address, :building_name, :phone_number, :purchase_id, :user_id, :item_id


  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipalities
    validates :user_id
    validates :item_id
    validates :phone_number
    validates :address
    validates :phone_number, format: { with: /\A0\d{10}\z/ }
    validates :prefectures_id, numericality: { other_than: 1 }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefectures_id: prefectures_id, municipalities: municipalities, phone_number: phone_number, building_name: building_name,user_id: user.id)
  end
end 