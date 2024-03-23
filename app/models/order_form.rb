class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:post_code,:region_of_origin_id,:municipality,:street_address,:building,:telephone_number,:purchase_record,:token
  
  
  validates :post_code,:region_of_origin_id,:municipality,:street_address,:telephone_number, presence: true
  validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
  validates :token, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true


  def save
    # 各テーブルにデータを保存する処理を書く
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingInformaiton.create(post_code: post_code,region_of_origin_id: region_of_origin_id,municipality: municipality,street_address: street_address,building: building,telephone_number: telephone_number,purchase_record_id: purchase_record.id)
  end
end