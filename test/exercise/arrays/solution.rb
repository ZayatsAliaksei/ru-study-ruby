module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |item| item.positive? ? array_max(array) : item }
      end

      def array_max(array)
        max = array[0]
        array.each do |item|
          max = item if item > max
        end
        max
      end

      def search(array, key, left = 0, right = array.size - 1)
        return -1 if left > right || key < array[left] || key > array[right]

        mid = left + ((right - left) / 2)

        return mid if array[mid] == key

        array[mid] > key ? search(array, key, left, mid) : search(array, key, mid + 1, right)
      end
    end
  end
end
