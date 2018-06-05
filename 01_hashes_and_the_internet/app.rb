require 'rest-client'
require 'json'
require 'pry'


# def get_reddit
#   response = RestClient.get 'https://www.reddit.com/.json'
#   json_response = JSON.parse(response)
#
#   binding.pry
# end
#
# get_reddit

def welcome
  puts "Welcome to your library application"
end

def get_term
  puts "What do you want search for? "
  term = gets.chomp
  # binding.pry
end

def search_for_term(term)
  response = RestClient.get "https://www.googleapis.com/books/v1/volumes?q={#{term}}"
  json = JSON.parse(response.body)

  json
end

def display_books(term)
  json = search_for_term(term)

  books = json["items"].map do |book|
    {
      title: book["volumeInfo"]["title"],
      publisher: book["volumeInfo"]["publisher"],
      publishedDate: book["volumeInfo"]["publishedDate"]
    }
  end

  books.each do |book|
    puts "==============="
    puts "Book Title: #{book[:title]}"
    puts "Book Publisher: #{book[:publisher]}"
    puts "Book Published At: #{book[:publishedDate]}"
    puts "==============="
  end
end

welcome
term = get_term
# puts
display_books(term)


# https://www.googleapis.com/books/v1/volumes?q={}
