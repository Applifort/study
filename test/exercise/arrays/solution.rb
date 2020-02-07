module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |el| (el < 0) ? el : max }
      end

      def search(array, query)
        if array.index(query)
          array.index(query)
        else
          -1
        end
      end
    end
  end
end
