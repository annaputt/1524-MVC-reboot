require_relative '../views/books_view'

class BooksController
  def initialize
    @view = BooksView.new
  end

  def list
    # Fetch ALL the books from Active Record. Create a variable with 'books =...' because you will use the data later
    books = Book.all
    # Display all books in View. @view connects to the view tab. Parenthesies passes the argument.
    @view.display(books)
  end

  def add
    # Ask for title => View
    title = @view.ask_user_for("title")
    # Ask for price
    price = @view.ask_user_for("price").to_i
    # Ask for author
    author = @view.ask_user_for("author")
    # Ask for category
    category = @view.ask_user_for("category")

    # Active Record
    book = Book.new(title: title, price: price)
    book.save
    # Create a new book
    # Save a new book
  end

  def edit
    # Fetch ALL the books from Active Record
    books = Book.all
    # Display all books
    @view.display(books)
    # Ask for which book by ID
    id = @view.ask_user_for("ID").to_i
    # Find the book
    book = Book.find(id)
    # Ask for title => View
    new_title = @view.ask_user_for("title")
    # Ask for price
    new_price = @view.ask_user_for("price").to_i
    # Ask for author
    new_author = @view.ask_user_for("author")
    # Ask for category
    new_category = @view.ask_user_for("category")

    # Edit the data
    book.title = new_title
    book.price = new_price
    book.author = new_author
    book.category = new_category
    # Save the new with new data
    book.save

  end

  def delete
    # Fetch ALL the books from Active Record
    # Display all books
    books = Book.all
    @view.display(books)
    # Ask for which book by ID
    id = @view.ask_user_for("ID").to_i
    # Find the book
    book = Book.find(id)
    # Detroy the book - doesn't need to be in a variable, so doesn't need to be a book = book.destroy
    book.destroy
  end

  def mark_as_rent
    # Fetch ALL the books from Active Record
    # Display all books
    books = Book.all
    @view.display(books)
    # Ask for which book by ID
    id = @view.ask_user_for("ID").to_i
    # Find the book
    book = Book.find(id)
    # Mark as rent
    if book.rent # => true, i.e. the book has been rented out, so returns false as it is not available
      book.rent = false
    else
      book.rent = true
    end
    # Save
    book.save
  end
end
