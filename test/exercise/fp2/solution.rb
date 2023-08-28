module Exercise
  module Fp2
    class MyArray < Array
      # Написать свою функцию my_each
      def my_each(index = 0, &block)
        return self if index >= size

        yield(self[index])
        my_each(index + 1, &block)
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
      def my_reduce(acc = nil, element = 0, &block)
        return acc if element >= size

        acc = acc.nil? ? self[0] : block.call(acc, self[element])
        my_reduce(acc, element + 1, &block)
      end
    end
  end
end
