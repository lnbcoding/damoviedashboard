get '/' do
  redirect '/movies'
end

get '/movies' do
  headers = { :accept => 'application/json' }

  find_top_movies = HTTParty.get("http://api.themoviedb.org/3/movie/popular?api_key=#{ENV['MOVIE_KEY']}", headers)

  @top_movies = find_top_movies['results'].take(15)

  erb :search
end
