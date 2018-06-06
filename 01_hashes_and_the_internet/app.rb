require 'rest-client'
require 'json'
require 'pry'

#def get_reddit
  #response = RestClient.get 'https://www.reddit.com/.json'

  #json_response = JSON.parse(response)

  #binding.pry
#end

#get_reddit

def welcome
  puts "Welcome to your library application"
end

def get_term
  puts "What do you want to search for? "
  term = gets.chomp
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
      published: book["volumeInfo"]["publishedDate"]
    }
    #book["volumeInfo"]["title"]

  end

  books.each do |book|
    puts "=================="
    puts "Book Title: #{book[:title]}"
    puts "Publisher: #{book[:publisher]}"
    puts "Published: #{book[:published]}"
    puts "=================="
  end

end


welcome
term = get_term
puts display_books(term)

# The Base URL: https://www.googleapis.com/books/v1/volumes?q={}
