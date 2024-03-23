class PurchaseRecord < ApplicationRecord
  has_one :shipping_informaiton

  belongs_to :user
  belongs_to :item
end
