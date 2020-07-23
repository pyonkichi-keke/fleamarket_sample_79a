# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

  ***DB設計***

## Usersテーブル
  |Column|Type|Options|
  |------|----|-------|
  |nickname|string|null: false, limt:15, index:true|
  |password|integer|null:false|
  |introduction|text|-------|
  |first_name|string|null:false|
  |last_name|string|null:false|
  |first_name_kana|string|null:false|
  |last_name_kana|string|null:false|
  |birthday|string|null:false|
  |e-mail|string|null:false, unique:true|
### Association
- has_many :commnets
- has_many :products
- has_many :like_product, through: :likes, source: :product
- has_many :comments dependent: :destroy
- has_many :likes dependent: :destroy
- has_many :products dependent: :destroy
- has_one :credit_card dependent: :destroy
- has_one :addresses dependent: :destroy
## Addressesテーブル
  |Column|Type|Options|
  |------|----|-------|
  |user_id|reterences|foreing_key:true|
  |postal_code|string|null:false|
  |prefecture|string|null:false|
  |city|string|null:false|
  |addresses|string|null:false|
  |apartment|string|-------|
### Association
- belongs_to User
## Productsテーブル
  |Column|Type|Options|
  |------|----|-------|
  |user_id|reterences|foreing_key:true|
  |name|string|null:false|
  |price|string|null:false|
  |product|string|null:false|
  |product_images|text|null:false|
  |text|text|-------|
  |status|integer|null:false, defolt:0|
  |size|string|null:false|
  |prefecture|string|null:false|
  |delivery|string|null:false|
  |delivery_time|string|null:false|
  |brand|string|null:false|
  |buy_user_id|reterences|foreing_key:true|
### Association
- belongs_to :user
- has_many :comment_users, through: :comments, source: :user
- belongs_to :categories
- has_many :likes dependent: :destroy
- has_many :comments dependent: :destroy
- has_many :categories dependent: :destroy
## commentsテーブル
  |Column|Type|Options|
  |------|----|-------|
  |user_id|reterences|foreing_key:true|
  |comment|txet|-------|
  |product|reterences|foreing_key:true|
### Association
- belongs_to :User
- belongs_to :Product
## Credit_cardsテーブル
  |Column|Type|Options|
  |------|----|-------|
  |user_id|reterences|foreing_key:true|
  |card_company|string|null:false|
  |card_number|integer|null:false|
  |card_year|integer|null:false|
  |card_month|integer|null:false|
  |card_pass|integer|null:false|
  |card_id|integer|null:false|
### Association
- belongs_to :User
## Likesテーブル
  |Column|Type|Options|
  |------|----|-------|
  |user_id|reterences|foreing_key:true|
  |product_id|reterences|foreing_key:true|
### Association
- belongs_to :User
- belongs_to :Product
## Categoriesテーブル
  |Column|Type|Options|
  |------|----|-------|
  |name|string|null:false|
  |ancestry|string|null:false|
### Association
- has_many :products