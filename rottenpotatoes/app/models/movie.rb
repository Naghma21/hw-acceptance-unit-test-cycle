class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.find_similar_movies(id)
    movie=self.find(id)
    #movies=Movie.where(director: movie.director).where.not(id: id)
    movies=Movie.where(director: movie.director)
    if(movie.director.empty?)
      return [movies,1,movie]
    else
      return [movies,0,movie]
    end
  end
end
