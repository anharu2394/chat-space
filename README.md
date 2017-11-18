# DB設計
## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|image|string||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :members
- has_many :user_groups
- has_many :messages

## usersテーブル

|Column|Type|Options|
|name|string|unique: true|
|email|string|unique: true|

### Association
- has_many :user_groups
- has_many :groups,through: :user_groups
- has_many :messages
- has_many :members

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
