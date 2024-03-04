# README

## users テーブル
|Column|Type|Options|
|------|----|-------|
| nick_name              | text | null: false|
| email                  | string | null: false,unique: true|
| encrypted_password     | string | null: false |
| name1                  | string   | null: false |
| name2                  | string   | null: false |
| name3                  | string   | null: false |
| name4                  | string   | null: false |
| date_of_birth          | date   | null: false |

### Association

- has_many :items
- has_many :puchase_records


## items テーブル
|Column|Type|Options|
|------|----|-------|
| name                                | string | null: false|
| explantion                          | text | null: false |
| category_id                            | integer   | null: false |
| situation_id                           | integer   | null: false |
| delivery_charge_id                     | integer   | null: false |
| region_of_origin_id                    | integer   | null: false |
| number_of_days_until_shipping_id       | integer   | null: false |
| price                               | integer   | null: false |
| user                            | references | null: false,foreign_key: true|

### Association

- belongs_to :user
- has_one : purchase_record

## purchase_record テーブル
|Column|Type|Options|
|------|----|-------|
| buyer                          | date   | null: false |
| purchase                        | date   | null: false |
| user                            | references | null: false,foreign_key: true|

### Association

-  belongs_to :user
-  belongs_to :item
-  has_one : shipping_informaiton

## shipping_informaiton テーブル
|Column|Type|Options|
|------|----|-------|
| post_code                   | string   | null: false |
| prefe_ctures                | date   | null: false |
| municipality                | string   | null: false |
| street_address              | string   | null: false |
| building                    | string   | |
| telephone_number            | string   | null: false |

### Association

-  belongs_to : purchase_record