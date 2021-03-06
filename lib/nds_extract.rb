# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point
pp directors_database

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method

movie_index = 0 
  while movie_index < movies_collection.length do 
    movies_collection[movie_index][:director_name] = name
    movie_index += 1
  end
  movies_collection
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
 studio_grosses = {}
 index = 0 
    while index < collection.length do 
      studio = collection[index][:studio]
      movie_gross = collection[index][:worldwide_gross]
    if !studio_grosses[studio]
      studio_grosses[studio] = movie_gross
    else 
      studio_grosses[studio] += movie_gross
    end
    index += 1 
  end
  studio_grosses
end

#def summary_snack_count_by_prices(snacks)
 # result = {}
  #i = 0
 
  #while i < snacks.length do
    # For readability, let's save this lookup to somethign meaningful
   # snack_name = snacks[i][:name]
    #snack_price = snacks[i][:price]
    # If there's no key for this number, add the number as a key and assign it
    # a new Array for holding future snacks with that price
    #if !result[snack_price]
     # result[snack_price] = 1
  #  else
   #   result[snack_price] += 1
    #end
    #i += 1
  #end
 
  #result
#end


def movies_with_directors_set(source)
  director_index = 0 
  movie_arrays = []
  while director_index < source.length do 
    dname = source[director_index][:name]
    director_movie_array = source[director_index][:movies]
    movies_with_dname = movies_with_director_key(dname, director_movie_array)
    movie_arrays.push(movies_with_dname)
    director_index += 1
  end
  movie_arrays
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
