module Exercise
  module Arrays
    class << self
      def replace(array)
        max = max(array)
        array.map { |el| (el < 0) ? el : max }
      end

      def max(array)
        array.reduce(array.first) { |a, e| e > a ? e : a }
      end

      def search(array, query)
        query = Hash[:first, 0, :last, array.length - 1, :searching_element, query] unless query.class == Hash
        if query[:first] <= query[:last]
          middle = (query[:first] + query[:last]) / 2
          return middle if query[:searching_element] == array[middle]
          case array[middle] - query[:searching_element]
          when ->(x) { x == 0 }
            middle
          when ->(x) { x <= 0 }
            query[:first] = middle + 1
            search(array, query)
          when ->(x) { x > 0 }
            query[:last] = middle - 1
            search(array, query)
          end
        else
          -1
        end
      end
    end
  end
end
