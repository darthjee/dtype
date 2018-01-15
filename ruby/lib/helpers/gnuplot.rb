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

    def plot_line(plot)
      plot_data_line(plot)
    end

    def plot_data_line(plot)
      [
         "'#{plot.input}'",
         "using ($#{plot.x_column}):($#{plot.y_column})",
         "t '#{plot.title}'",
      ].tap do |args|
        args << "w #{plot.with}" if plot.with
      end.join(' ')
    end
  end
end

