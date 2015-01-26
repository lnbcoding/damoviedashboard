after do
  ActiveRecord::Base.clear_active_connections!
end

get '/' do
  redirect '/movies'
end

get '/movies' do
  headers = { :accept => 'application/json' }

  find_top_movies = HTTParty.get("http://api.themoviedb.org/3/movie/popular?api_key=#{ENV['MOVIE_KEY']}", headers)

  @top_movies = find_top_movies['results'].take(15)

  erb :search
end

get '/movies/popular' do
  headers = { :accept => 'application/json' }

  find_top_movies = HTTParty.get("http://api.themoviedb.org/3/movie/popular?api_key=#{ENV['MOVIE_KEY']}", headers)

  @top_movies = find_top_movies['results'].take(15)

  erb :movies
end

get '/movie/search' do
  movie_title = params[:title].force_encoding('ASCII-8BIT')
  movie_year = params[:year]

  movie_title = URI::encode(movie_title)

  movie_string = HTTParty.get("http://www.omdbapi.com/?t=#{movie_title}+&y=#{movie_year}+&plot=short&r=json")

  if movie_string
    @movie = JSON.parse(movie_string)
    erb :movie
  else
    redirect '/'
  end
end
