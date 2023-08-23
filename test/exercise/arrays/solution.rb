module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |item| item > 0 ? array.max() : item }
      end

      def search(_array, _query)
        return -1 unless _array.include?(_query)

        _array.bsearch_index {|x| x >= _query}
      end
    end
  end
end
