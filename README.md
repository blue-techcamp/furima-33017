# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| birth_date         | string              | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name_kana    | string              | null: false             |

### Association

* has_many :items
* has_one :address
* has_many :purchase_record

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| seller                              | string     | null: false       |
| image                               | text       | null: false       |
| name                                | string     | null: false       |
| info                                | text       | null: false       |
| price                               | integer    | null: false       |
| info                                | text       | null: false       |
| price_half_width_num                | integer    | null: false       |
| price_out_of_set_range              | integer    | null: false       |
| category                            | string     | null: false       |
| sales_status                        | string     | null: false       |
| shipping_fee_status                 | string     | null: false       |
| prefecture                          | string     | null: false       |
| scheduled_delivery                  | integer    | null: false       |

### Association

- belongs_to :user
* has_one :address
* has_many :purchase_record

## address table

| Column                | Type       | Options           |
|-----------------------|------------|-------------------|
| postal_code           | integer    | null: false       |
| prefectures           | string     | null: false       |
| municipalities        | string     | null: false       |
| house_num             | integer    | null: false       |
| tel                   | integer    | null: false       |

### Association

- belongs_to :user
- belongs_to :items
* has_many :purchase_record

## purchase_record table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| buyer              | string              | null: false             |
| item               | string              | null: false             |

### Association

- belongs_to :user
- belongs_to :items
- belongs_to :address