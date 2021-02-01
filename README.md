# DB 設計

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|--------------------------|
| nickname           | string              | null: false              |
| email              | string              | null: false unique: true |
| encrypted_password | string              | null: false              |
| birth_date         | date                | null: false              |
| last_name          | string              | null: false              |
| first_name         | string              | null: false              |
| last_name_kana     | string              | null: false              |
| first_name_kana    | string              | null: false              |

### Association

* has_many :items
* has_many :orders

## items table

| Column                 | Type       | Options           |
|------------------------|------------|-------------------|
| user                   | references | foreign_key: true |
| name                   | string     | null: false       |
| info                   | text       | null: false       |
| price                  | integer    | null: false       |
| category_id            | integer    | null: false       |
| sale_status_id         | integer    | null: false       |
| shipping_fee_status_id | integer    | null: false       |
| prefecture_id          | integer    | null: false       |
| scheduled_delivery_id  | integer    | null: false       |

### Association

- belongs_to :user
* has_one :order

## address table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| order           | references | foreign_key: true |
| postal_code     | string     | null: false       |
| prefecture_id   | integer    | null: false       |
| city            | string     | null: false       |
| house_num       | string     | null: false       |
| building_name   | string     | null: false       |
| phone_num       | string     | null: false       |

### Association

- belongs_to :order
- belongs_to :order

## order table

| Column | Type       | Options           |
|--------|------------|-------------------|
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
* has_one :address