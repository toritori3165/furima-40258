# README

## usersテーブル
|  Column     |Type      |Options                                             |
|-------------|----------|----------------------------------------------------|
|nickname     |string    |null: false                                         |
|name         |string    |null: false, name_contains_full_width_characters    |
|name_katakana|string    |null: false, name_contains_full_width_characters    |
|birthday     |integer   |null: false                                         |
|email        |string    |null: false, unique: true                           |
|password     |string    |null: false, length: minimum 6, password_complexity |
|user         |references|null: false                                         |

has_many :items
has_many :orders

## itemsテーブル
|  Column         |Type       |Options                       |
|-----------------|-----------|------------------------------|
|item_name        |string     |null: false, length: max 40   |
|text             |text       |null: false, length: max 1000 |
|category         |string     |null: false                   |
|condition        |string     |null: false                   |
|shipping_fee     |string     |null: false                   |
|area             |string     |null: false                   |
|shipping_to_date |string     |null: false                   |
|price            |integer    |null: false                   |
|user             |references |null: false                   |

belongs_to :user
has_one :order

## ordersテーブル
| Column |Type       |Options     |
|--------|-----------|------------|
|user    |references |null: false |
|item    |references |null: false |
|address |reference  |null: false |

belongs_to :user
belongs_to :item
has_one :address

## addressesテーブル
| Column      |Type       |Options     |
|-------------|-----------|------------|
|zip_code     |integer    |null: false |
|prefecture   |string     |null: false |
|city         |string     |null: false |
|house_number |string     |null: false |
|building     |string     |            |
|tel          |integer    |null: false |
|order        |references |null: false |

belongs_to :order