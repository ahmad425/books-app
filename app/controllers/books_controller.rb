class BooksController < ApplicationController
  before_action :fetch_books, only: [:index]

  def index
    respond_to do |format|
      format.html { @books }
      format.json {
        render json: @books
      }
    end
  end

  def assign_tag
    tag = Tag.find(params[:tag_id])
    if tag.present?
      Book.where(id: params[:books_ids]).each do |b|
        BookTag.find_or_create_by(book_id: b.id, tag_id: tag.id)
      end
    end
    redirect_to root_path
  end

  private

  def fetch_books
    @books = Book.all
    @books = @books.joins(:tags).where('tags.id = ?', params[:tag_id]) if params[:tag_id].present?
    @books = @books.where(price: params[:price].to_i) if params[:price].present?
  end
end
