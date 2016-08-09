module Helpers
  module Gnuplot
    def range(array)
      if array.nil?
        array = Array.new(2)
      end
      if array.size < 2
        array = array + [ nil ]
      end

      array = array.map { |v| v.nil? ? '*' : v.to_s }
      "[#{array.join(':')}]"
    end
  end
end

