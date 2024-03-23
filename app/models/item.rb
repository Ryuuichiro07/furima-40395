class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  has_many :purchase_records

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge, class_name: "DeliveryCharge"
  belongs_to :region_of_origin, class_name:"RegionOfOrigin"
  belongs_to :number_of_days_until_shipping, class_name:"NumberOfDaysUntilShipping"

    #空の投稿を保存できないようにする
    validates :name, presence: true
    validates :explantion, presence: true
    validates :category_id, presence: true
    validates :situation_id, presence: true
    validates :delivery_charge_id, presence: true
    validates :region_of_origin_id, presence: true
    validates :number_of_days_until_shipping_id, presence: true
    validates :image, presence: true

    #ジャンルの選択が「---」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :situation_id, numericality: { other_than: 1 , message: "can't be blank"} 
    validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :region_of_origin_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :number_of_days_until_shipping_id, numericality: { other_than: 1 , message: "can't be blank"} 

    validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

end
