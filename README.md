# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
|last_name      | string | null: false |
|first_name     | string | null: false |
|last_name_kana | string | null: false |
|first_name_kana| string | null: false |
|birth_date     | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type    　　| Options     |
| --------          | ------  　　| ----------- |
| user              | references | null: false |
| name              | string 　 　| null: false |
| items_description | text   　 　| null: false |
| category_id       | integer　 　| null: false |
| condition_id      | integer　 　| null: false |
| shipping_payer_id | integer  　　| null: false |
| consignor_id      | integer　 　| null: false |
| delivery_time_id  | integer 　　| null: false |
| price             | integer 　　| null: false |

### Association

- has_one :purchases

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |

### Association

- has_one :items
- has_one :address

## address テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| postcode     | string     | null: false                    |
| prefecture_id| integer    | null: false                    |
| city         | string     | null: false                    |
| building_name| string     |                                |
| phone_number | string    | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association
 - belongs_to :purchases