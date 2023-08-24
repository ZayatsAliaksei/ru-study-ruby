module Exercise
  module Fp2
    class MyArray < Array
      # Написать свою функцию my_each
      def my_each
        for item in self
          yield(item)
        end
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) do |result, element|
          result << yield(element)
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |result, element|
          result << element unless element.nil?
          result
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial = nil)
        accumulator = initial || self[0]
        index = initial ? 0 : 1
        while index < length
          accumulator = yield(accumulator, self[index])
          index += 1
        end
        accumulator
      end
    end
  end
end
