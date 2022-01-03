class CreateBookTags < ActiveRecord::Migration[5.2]
  def change
    create_table :book_tags do |t|
      t.belongs_to :book, index: true, foreign_key: true
      t.belongs_to :tag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
