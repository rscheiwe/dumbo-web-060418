require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  #binding.pry

  film_urls = []
  character_hash["results"].map do |item|
    if item["name"] == character
      film_urls << item["films"]
      #puts item["films"]
    end
  end

  films_array = []

  film_urls.flatten.each do |film|
    film_info = RestClient.get(film)
    films_array << JSON.parse(film_info.body) #array of hashes containing film info
  end
  #binding.pry


  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
  #puts films

  films_array
end


def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice
  #films_hash is an ARRAY!!!


  films = films_hash.map do |info_hash|
      {
        Title: info_hash["title"],
        Director: info_hash['director'],
        Producer: info_hash['producer'],
        Release_Date: info_hash['release_date']
      }
    end

    films.each do |film|
      puts "     ====================="
      puts "Film Title: #{film[:Title]}"
      puts "Director: #{film[:Director]}"
      puts "Producer: #{film[:Producer]}"
      puts "Release Date: #{film[:Release_Date]}"
      puts "     ====================="
    end

# books.each do |book|
#   puts "=================="
#   puts "Book Title: #{book[:title]}"
#   puts "Publisher: #{book[:publisher]}"
#   puts "Published: #{book[:published]}"
#   puts "=================="
# end
        # if title_hash[key]
        #   title_hash[key] = value
        # else
        #   title_hash[key] = []
        #   title_hash[key] = value
        # end

        #HASH OF HASHES

        # new_film_hash = {}
        # films_hash.map do |info_hash|
        # new_title = info_hash["title"]
        #
        # if new_film_hash[new_title]
        # else
        #   new_film_hash[new_title] = {
        #       Director: info_hash['director'],
        #       Producer: info_hash['producer'],
        #       Release_Date: info_hash['release_date']
        #     }
        # end
        
    # info_hash.each do |key, value|
    #   {
    #     "#{key}: #{value}"
    #   }
    # end
  end

# films_hash = get_character_movies_from_api("Luke Skywalker")
# parse_character_movies(films_hash)

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

show_character_movies("C-3PO")

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
