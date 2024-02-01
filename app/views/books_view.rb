class BooksView
  def display(books)
    books.each do |book|
      status = book.rent ? "Unavailable" : "Available"
      # book.rent = !book.rent # => same as line above just shorter

      puts "\nID:#{book.id} - TITLE: #{book.title}"

      puts "#{status} #{book.id} = #{book.title}"
    end
  end

  def ask_user_for(thing)
    puts "what is #{thing}?"
    gets.chomp
  end
end
