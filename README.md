## アプリ名
car-reviews

## 内容
- ユーザー登録ができる
- 車のレビューをカテゴリー付きで投稿できる
- 自分のマイページで自分の投稿とお気に入りを確認できる
- 他人のマイページで他人の投稿とお気に入りを確認できる
- カテゴリーごとに投稿が検索できる

## 使い方
- 右上の「LOGIN」ボタンでログイン
- ヘッダーにある「投稿する」でレビューを投稿
- 投稿時にカテゴリーを選択するとレビューカテゴリーを付与することができる
- トップページでレビューの画像、タイトル、「続きはここをクリック」いずれかをクリックするとレビューの詳細ページへ遷移する
- 投稿者名をクリックすると投稿者のマイページへ遷移する(自分以外のユーザーのマイページも確認可能)
- ヘッダーにあるカテゴリーボタンで任意のカテゴリーが付与されたレビューを検索することができる
- トップページに検索フォームがあり入力し「検索」ボタンをクリックすると関連するタイトルの投稿が検索できる
- フッターにあるTwitterボタンをクリックすることでツイートすることができる


## デプロイ先
https://car-review-yoshizawa.herokuapp.com/

## basic認証
- name admin
- pass 6666

## テスト用ユーザー1
- username
テストくん
- email
test@gmail.com
- pass
testtest


## テスト用ユーザー2
- username
test:b
- email
testb@gmail.com
- pass
testtest


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :reviews
- has_many :comments
- has_many :like_reviews
- has_many :like_comments


## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|text|text|null: false|
|image|string||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :like_reviews
- has_many :tags though:  :reviews_tags
- has_many :reviews_tags


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|reviews_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :review
- has_many :like_comments


## like_reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|review_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :review

## like_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|comment_id|integer|null: false, , foreign_key: true|
### Association
- belongs_to :user
- belongs_to :comment

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|tag_name|string|null: false|
|review_id|integer|null: false, foreign_key: true|
### Association
- has_many :reviews though:  :reviews_tags
- has_many :reviews_tags

## reviews_tags
|Column|Type|Options|
|------|----|-------|
|review_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### association
- belongs_to :review
- belongs_to :tag