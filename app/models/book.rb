class Book < ApplicationRecord
  has_many :book_tags
  has_many :tags, through: :book_tags

  validates :title, uniqueness: true, presence: true
end
