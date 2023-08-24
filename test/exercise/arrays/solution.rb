module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |item| item.positive? ? array.max : item }
      end

      def search(array, key)
        binary_search_rec(array, key, 0, array.length)
      end

      def binary_search_rec(array, key, left, right)
        return -1 if left >= right

        mid = left + ((right - left) / 2)

        return -(1 + left) if left >= right

        if array[mid] == key
          mid
        elsif array[mid] > key
          binary_search_rec(array, key, left, mid)
        else
          binary_search_rec(array, key, mid + 1, right)
        end
      end
    end
  end
end
