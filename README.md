# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| name               | string | null: false              |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
|                    |        |                          |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| text           | string     | null: false                    |
| title          | text       | null: false                    |
| explanation    | text       | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user