module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]
        search_max = lambda do |index|
          return if index == array.length - 1
          max = array[index] if array[index] > max
          return search_max.call(index + 1)
        end
        search_max.call(0)
        array.map { |el| (el < 0) ? el : max }
      end

      def search(array, query)
        return -1 if array.empty?
        binary_search = lambda do |first_index, last_index|
          if first_index == last_index
            return query == array[last_index] ? last_index : -1
          end
          middle_index = (first_index + last_index) / 2
          middle_element = array[middle_index]
          check = middle_element - query
          case check
          when ->(x) { x == 0 }
            return middle_index
          when ->(x) { x < 0 }
            binary_search.call(middle_index + 1, last_index)
          when ->(x) { x > 0 }
            binary_search.call(first_index, middle_index - 1)
          end
        end
        binary_search.call(0, array.length - 1)
      end
    end
  end
end
