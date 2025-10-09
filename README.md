## usersテーブル

| Column             | Type      | Options      |
| --------------     | --------- | ------------ |
| nickname           | string    | null: false  |
| email              | string    | null: false, unique: true  |
| encrypted_password | string    | null: false  |
| last_name          | string    | null: false  |
| first_name         | string    | null: false  |
| last_name_kana     | string    | null: false  |
| first_name_kana    | string    | null: false  |
| birthday           | string    | null: false  |


### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column                  | Type       | Options      |
| ----------------------- | ---------- | ------------ |
| name                    | string     | null: false  |
| description             | string     | null: false  |
| category_id             | integer    | null: false  |
| status_id               | integer    | null: false  |
| shipping_fee_id         | integer    | null: false  |
| prefecture_id           | integer    | null: false  |
| schedule_delivery_id    | integer    | null: false  |
| price                   | integer    | null: false  |
| user                    | references | null: false, foreign key: true  |



### Association
- belongs_to :user
- has_one :order


## ordersテーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------        |
| user             | references | null: false, foreign key: true  |
| item             | references | null: false, foreign key: true  |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address



## addressesテーブル

| Column                | Type       | Options      |
| --------------------- | ---------- | ------------ |
| postal_code           | string     | null: false  |
| prefecture_id         | integer    | null: false  |
| city                  | string     | null: false  |
| house_number          | string     | null: false  |
| building_name         | string     | null: false  |
| phone_number          | string     | null: false  |
| order                 | references | null: false, foreign key: true  |



### Association
- belongs_to :order


# PR用の追記です（あとで削除します） 
