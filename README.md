# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | unique: true            |
| encrypted_password | string              | null: false             |
| birth_date         | date                | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name_kana    | string              | null: false             |

### Association

* has_many :items
* has_many :purchase_record

## items table

| Column                 | Type       | Options           |
|------------------------|------------|-------------------|
| seller                 | string     | null: false       |
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
* has_one :purchase_record

## address table

| Column                      | Type       | Options           |
|-----------------------------|------------|-------------------|
| token                       | integer    | null: false       |
| postal_code                 | integer    | null: false       |
| postal_code_input_correctly | integer    | null: false       |
| prefecture                  | string     | null: false       |
| city                        | string     | null: false       |
| address                     | string     | null: false       |
| phone_num                   | integer    | null: false       |
| phone_num_input_only_num    | integer    | null: false       |

### Association

* has_many :purchase_record

## purchase_record table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| buyer              | string              | null: false             |
| item               | string              | null: false             |

### Association

- belongs_to :user
- belongs_to :items
* has_one :address