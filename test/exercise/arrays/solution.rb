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
        length = array.length
        return -1 if array.empty?
        return array[0] == query ? 0 : -1 if length == 1
        middle = length / 2
        case array[middle] - query
        when ->(x) { x == 0 }
          return middle
        when ->(x) { x < 0 }
          continues_index = search(array[middle + 1..length - 1], query)
          continues_index = 1 if continues_index == 0
          return continues_index == -1 ? -1 : middle + continues_index + 1
        when ->(x) { x > 0 }
          continues_index = search(array[0..middle - 1], query)
          return continues_index == -1 ? -1 : continues_index
        end
      end
    end
  end
end
