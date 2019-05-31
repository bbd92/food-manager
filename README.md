# README

# DB設計

## users table
|Column|Type|Options|index|
|------|----|-------|-----|
|name|string|null: false|○|
|provisional_expiration_date|integer|null: false, default: 3|-|

### association
- has_many: foods
- has_many: categories

## foods table
|Column|Type|Options|index|
|------|----|-------|-----|
|name|string|null: false|○|
|category_id|integer|null: false, foreign_key: true|-|
|quantity|integer|null: false|-|
|expiration_date|string|null: false, default: provisional_expiration_date|
|user_id|integer|null: false, foreign_key: true|

### association
- belongs_to: user
- belongs_to: food

## categories table
|Column|Type|Options|index|
|------|----|-------|-----|
|name|string|null: false|-|
|user_id|integer|null: false, foreign_key: true|

### association
- belongs_to: user
- has_many: foods