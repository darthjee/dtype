module Helpers
  module Gnuplot
    def range(array)
      array = array.nil? ?
              Array.new(2) :
              (array + Array.new(2 - array.size))

      array = array.map { |v| v.nil? ? '*' : v.to_s }
      "[#{array.join(':')}]"
    end

    def plot_line(plot)
      case plot
      when ::Gnuplot::Plot::Data
        plot_data_line(plot)
      when ::Gnuplot::Plot::Function
        plot_function(plot)
      end
    end

    def plot_function(plot)
      plot.name
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

    def define(function)
      function.to_gnu
    end
  end
end

