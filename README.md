# 1. 목표
조건에 맞는 성인용 SNS를 구현합니다.

# 2. 모델 속성 표
USER 모델<br>
|id | name | phone | age|<br>
|-- | ---- | ----- | ---|<br>
|integer | string | integer | integer|<br>

POST 모델<br>
|id | title | content |<br>
|-- | ----- | ------- |<br>
|integer | string | text|<br>

COMMENT 모델<br>
|id | comment|<br>
|-- | -------|<br>
|integer | text|<br>

# 3. 각각 모델 코드
USER모델 <br>
```
class CreateUsers < ActiveRecord::Migration[5.0]
  require 'faker'
  Faker::Name.name
  Faker::PhoneNumber.phone
  
  has_many :posts
  
  RegExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

  validates :name, presence: true, length: {minimum: 11}
  validates :age, numericality: {only_integer: true, greater_than: 19}, presence: true
  validates :phone, format: {with: RegExp}, uniqueness: {case_sensitive: false}, presence: true
  
  def change
    create_table :users do |t|
      t.string :name
      t.integer :phone
      t.integer :age

      t.timestamps
    end
  end
end
```
POST모델 <br>
```
class CreatePosts < ActiveRecord::Migration[5.0]
  
  belongs_to :users
  has_many :comments
  
  words = ["fuck", "shit", "bitch"]
  
  before_save{ 
    words.each do |word| 
      len = word.length
      self.content.gsub!(/#{word}/, '*'*len) if(self.content.include?(word))
    end
  }

  
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
```
COMMENT 모델
```
class CreateComments < ActiveRecord::Migration[5.0]
  
  belongs_to :posts
  
  validates :content, length: {maximum: 100}
  
  def change
    create_table :comments do |t|
      t.text :content
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
```
# 4. .task 파일
```
namespace :my_task do
  desc "TODO"
  task test1: :environment do
    puts rand(20..29).sample(20)
  end

  desc "TODO"
  task test2: :environment do
    puts rand(30..39).sample(10)
  end

  desc "TODO"
  task test3: :environment do
    puts rand(40..49).sample(5)
  end

  desc "TODO"
  task test4: :environment do
    puts rand(50..59).sample(5)
  end

  def twenty_group
    My_task.create test1
    User.create name
    User.create phone
  end
  
  def thirty_group
    My_task.create test2
    User.create name
    User.create phone
  end
  
  def forty_group
    My_task.create test3
    User.create name
    User.create phone
    Comment.create comments
  end
  
  def fifty_group
    My_task.create test4
    User.create name
    User.create phone
    Post.create posts
  end
  
end
```

# 5. 소감
컨트롤러와 뷰에 이어 모델에 대해 더 확실히 이해할 수 있는 기회였습니다. 
MVC를 모두 공부하고 나니 일부분만 알고 있었을 때보다 프로그램에 대한 이해가 높아졌고
더 재미있어졌습니다.