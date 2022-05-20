class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :purchase
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefectures
  belongs_to :days_for_delivery

  with_options presence: true do
    validates :name, :explanation, :image

    with_options numericality: { other_than: 1 } do
      validates :category_id, :condition_id, :delivery_charge_id, :prefectures_id, :days_for_delivery_id
    end

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { greater_than: 300, less_than: 9_999_999 }
    end
  end
end
