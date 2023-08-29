module Exercise
  module Fp2
    class MyArray < Array
      # Написать свою функцию my_each
      def my_each(&block)
        return self unless block_given?

        yield(first)
        self[1..].my_each(&block)
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
      def my_reduce(acc = nil, &block)
        return self unless block_given?

        acc = acc.nil? ? first : block.call(acc, first)
        self[1..].my_reduce(acc, &block)
      end
    end
  end
end
