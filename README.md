# README

## users テーブル
|Column|Type|Options|
|------|----|-------|
| nick_name              | text | null: false|
| email                  | string | null: false,unique: true|
| encrypted_password     | string | null: false |
| name1                  | text   | null: false |
| name2                  | text   | null: false |
| date_of_birth          | date   | null: false |

### Association

- has_many :items
- has_many :puchase_records


## items テーブル
|Column|Type|Options|
|------|----|-------|
| image                               | string | null: false|
| name                                | text | null: false,unique: true|
| explantion                          | string | null: false |
| category                            | text   | null: false |
| situation                           | text   | null: false |
| delivery_charge                     | date   | null: false |
| region_of_origin                    | date   | null: false |
| number_of_days_until_shipping       | date   | null: false |
| price                               | text   | null: false |
| commission                          | text   | null: false |
| sales_profit                        | text   | null: false |
| user                            | references | null: false,foreign_key: true|

### Association

- belongs_to :user
- has_one : purchase_records

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
| post_code                   | date   | null: false |
| prefe_ctures                | date   | null: false |
| municipality                | date   | null: false |
| street_address              | date   | null: false |
| building                    | date   | null: false |
| telephone_number            | date   | null: false |

### Association

-  belongs_to : purchase_record