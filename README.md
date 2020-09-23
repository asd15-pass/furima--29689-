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
| image             | string  　　| null: false |
| name              | string 　 　| null: false |
| items_description | text   　 　| null: false |
| category          | string 　 　| null: false |
| condition         | string 　 　| null: false |
| shipping_payer    | string  　　| null: false |
| consignor         | string 　 　| null: false |
| delivery_time     | integer 　　| null: false |
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
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| building_name| string     |                                |
| phone_number | integer    | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association
 - has_one :purchases