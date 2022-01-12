class Book < ApplicationRecord
  has_many :book_tags
  has_many :tags, through: :book_tags

  validates :title, uniqueness: true, presence: true

  def self.assign_book_tag(tag, books_ids)
    where(id: books_ids).each do |book|
      BookTag.find_or_create_by(book_id: book.id, tag_id: tag.id)
    end
  end
end
