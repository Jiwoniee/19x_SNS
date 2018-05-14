class User < ApplicationRecord
  has_many :posts
  has_many :comments
  RegExp = /(\d{3}).*(\d{3}).*(\d{4})/

  validates :name, presence: true, length: {minimum: 10}
  validates :age, numericality: {only_integer: true, greater_than: 19}, presence: true
  validates :phone, format: {with: RegExp}, uniqueness: {case_sensitive: false}, presence: true
end
