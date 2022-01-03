class ApplicationMailer < ActionMailer::Base
  default from: 'admin@example.com'
  layout 'mailer'

  def most_tagged_books(books)
    @books = books
    mail(to: "no.reply@gmail.com", subject: "Most Tagged Books")
  end
end
