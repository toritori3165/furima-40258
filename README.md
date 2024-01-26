# README

## usersテーブル
|  Column           |Type      |Options                   |
|-------------------|----------|--------------------------|
|nickname           |string    |null: false               |
|last_name          |string    |null: false               |
|first_name         |string    |null: false               |
|last_name_kana     |string    |null: false               |
|first_name_kana    |string    |null: false               |
|birthday           |date      |null: false               |
|email              |string    |null: false, unique: true |
|encrypted_password |string    |null: false               |

has_many :items
has_many :orders

## itemsテーブル
|  Column            |Type       |Options                        |
|--------------------|-----------|-------------------------------|
|item_name           |string     |null: false                    |
|content             |text       |null: false                    |
|category_id         |integer    |null: false                    |
|condition_id        |integer    |null: false                    |
|shipping_fee_id     |integer    |null: false                    |
|area_id             |integer    |null: false                    |
|shipping_to_date_id |integer    |null: false                    |
|price               |integer    |null: false                    |
|user                |references |null: false, foreign_key: true |

belongs_to :user
has_one :order

## ordersテーブル
| Column |Type       |Options                       |
|--------|-----------|------------------------------|
|user    |references |null: false, foreign_key: true|
|item    |references |null: false, foreign_key: true|

belongs_to :user
belongs_to :item
has_one :address

## addressesテーブル
| Column      |Type       |Options                        |
|-------------|-----------|-------------------------------|
|zip_code     |string     |null: false                    |
|area_id      |integer    |null: false                    |
|city         |string     |null: false                    |
|house_number |string     |null: false                    |
|building     |string     |                               |
|tel          |string     |null: false                    |
|order        |references |null: false, foreign_key: true |

belongs_to :order