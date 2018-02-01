module Helpers
  module Tex
    include Helpers::Number

    def format_tex_number(number)
      "$#{format_number(number)}$"
    end
  end
end
