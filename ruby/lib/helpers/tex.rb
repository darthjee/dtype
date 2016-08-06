%w(
  helpers/number
).each do |lib|
  Utils::Loader.new(lib).require_cascade
end


module Helpers
  module Tex
    include Helpers::Number

    def format_tex_number(number)
      "$#{format_number(number)}$"
    end
  end
end
