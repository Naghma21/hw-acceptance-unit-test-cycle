class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.find_similar_movies(id)
    movie=self.find(id)
    sad_path=0
    movies=Movie.where(director: movie.director).where.not(id: id)
    if((not movie.director) or (movies.length==0))
      sad_path=1
    end
    return [movies,sad_path,movie]
  end
end
