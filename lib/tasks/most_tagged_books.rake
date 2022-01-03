namespace :most_tagged_books do
  desc "send an email for most tagged books"
  task send_email: :environment do
    books = Book.joins(:tags).select("books.*, count(tags.id) as tags_count").group("books.id").order("tags_count desc").limit(3)
    ApplicationMailer.most_tagged_books(books).deliver if books.any?
  end
end
