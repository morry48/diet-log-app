# Diet-log-app

*マクロ栄養素管理機能(食事におけるタンパク質・脂質・炭水化物をグラム単位で管理)
*体重管理機能
*ユーザー管理機能


##アソシエーションについて
usersテーブルとlogsテーブル  一対多
usersテーブルとweight_logs  一対多


##usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|text|null: false, unique: true|
|password|text|null: false|
|nickname|string|null: false|

class User < ActiveRecored: :base
  has_many:logs
  has_many:weight_logs
end


##logsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|protein|float|null: false|
|fat|float|null: false|
|carbohydrate|float|null: false|
|start_time|datetime|null: false|
|user_id|references|foreign_key: ture|

class Log < ActiveRecord: :Base
  belong_to :user
end


##weight_logsテーブル

|Column|Type|Options|
|------|----|-------|
|weight|float|null: false|
|start_time|datetime|null: false|
|user_id|references|foreign_key: ture|

class WeightLog < ActiveRecord: :Base
  belong_to :user
end