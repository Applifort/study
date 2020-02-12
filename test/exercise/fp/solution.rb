module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        matched_films = films.select do |film|
          film['country'].to_s.include?(',') && film['rating_kinopoisk'] &&
            film['rating_kinopoisk'].to_f.positive?
        end
        ratings = matched_films.map { |film| film['rating_kinopoisk'].to_f }
        count = ratings.length
        total = ratings.reduce(:+)
        total / count
      end

      def chars_count(films, threshold)
        searching_letter = 'и'
        filtered_films = films.select { |film| film['rating_kinopoisk'].to_f > threshold }
        filtered_films.map { |film| film['name'].to_s.count(searching_letter) }.reduce(:+)
      end
    end
  end
end
