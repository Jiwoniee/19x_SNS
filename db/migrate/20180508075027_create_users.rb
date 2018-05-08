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
