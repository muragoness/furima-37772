# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| name               | string | null: false              |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| explanation          | text       | null: false                    |
| user                 | references | null: false, foreign_key: true |
| category_id          | integer    | null: false                    |
| condition_id         | integer    | null: false                    |
| delivery_charge_id   | integer    | null: false                    |
| prefectures_id       | integer    | null: false                    |
| days_for_delivery_id | integer    | null: false                    |
| price                | integer    | null: false                    |

### Association

- has_one :purchase
- belongs_to :user


## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping_address



## shipping_address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase