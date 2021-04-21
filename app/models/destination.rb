class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

   validates :name, uniqueness: true
end
