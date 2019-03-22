# README

## users table

| Column   | Type       | Options                                |
|----------|------------|----------------------------------------|
| name     | string     | null: false, unique: true, index: true |
| email    | string     | null: false, unique: true, index: true |
| password | string     | null: false                            |
| group_id | references | null: false, foreign_key: true         |

### Association

 - has_many :ideas

 - has_many :todos

 - has_many :chats

 - has_many :user_groups

 - has_many :groups, through: :user_groups

## groups table

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| name    | string     | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association

 - has_many :chats

 - has_many :user_groups

 - has_many :users, through: :user_groups

## user_groups table

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| user_id  | references | null: false, foreign_key: true |
| group_id | references | null: false, foreign_key: true |

### Association

 - belongs_to :user

 - belongs_to :group

## chats table

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| chat     | text       |                                |
| image    | string     |                                |
| user_id  | references | null: false, foreign_key: true |
| group_id | references | null: false, foreign_key: true |
| created_at | timestamps | null: false                  |

### Association

 - belongs_to :user

 - belongs_to :group

## todos table

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| todo     | text       | null: false                    |
| deadline | datetime   | null: false                    |
| finished | boolean    | null:false, default: false     |
| user_id  | references | null: false, foreign_key: true |
| created_at | timestamps | null: false                  |

### Association

 - belongs_to user

## ideas table

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| idea    | text       |                                |
| image   | string     |                                |
| user_id | references | null: false, foreign_key: true |
| created_at | timestamps | null: false                 |

### Association

 - belongs_to user