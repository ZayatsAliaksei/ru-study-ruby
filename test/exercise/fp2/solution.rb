module Exercise
  module Fp2
    class MyArray < Array
      # Написать свою функцию my_each
      def my_each(&block)
        return self unless block_given?

        yield(first)
        MyArray.new(self[1..]).my_each(&block) unless self[1..].empty?
        self
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
        return acc unless block_given?
        return acc if size < 1

        acc = acc.nil? ? first : block.call(acc, first)
        rest = MyArray.new(self[1..])
        rest.my_reduce(acc, &block)
      end
    end
  end
end
