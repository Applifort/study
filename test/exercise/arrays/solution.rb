module Exercise
  module Arrays
    class << self
      def replace(array)
        max = max(array)
        array.map { |el| (el < 0) ? el : max }
      end

      def max(array)
        max = array.last
        index = 1
        while index < array.length
          max = array[index] if array[index] > max
          index += 1
        end
        max
      end

      def search(array, query)
        query = Hash[:first, 0, :last, array.length - 1, :searching_element, query] unless query.class == Hash
        return -1 if array.empty?
        if query[:first] == query[:last]
          return query[:searching_element] == array[query[:last]] ? query[:last] : -1
        end
        middle_index = (query[:first] + query[:last]) / 2
        middle_element = array[middle_index]
        check = middle_element - query[:searching_element]
        case check
        when ->(x) { x == 0 }
          middle_index
        when ->(x) { x < 0 }
          query[:first] = middle_index + 1
          search(array, query)
        when ->(x) { x > 0 }
          query[:last] = middle_index - 1
          search(array, query)
        end
      end
    end
  end
end
