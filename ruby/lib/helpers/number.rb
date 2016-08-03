require './lib/helpers'

module Helpers
  module Number
    def format_number(number)
      number.to_s.reverse.split(/(\d{3})/).select(&:present?).join('.').reverse
    end
  end
end
