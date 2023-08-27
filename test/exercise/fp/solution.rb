module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        filtered_ratings(films).reduce(:+) / filtered_ratings(films).length
      end

      def filtered_ratings(films)
        films.map do |film|
          rating = film['rating_kinopoisk']
          rating.to_f if film['country'].to_s.split(',').length >= 2 && rating.to_f.positive?
        end.compact
      end

      def chars_count(films, threshold)
        filtered = films.select do |film|
          film['rating_kinopoisk'].to_f >= threshold
        end

        filtered.reduce(0) { |sum, film| sum + film['name'].count('и') }
      end
    end
  end
end
