require './lib/array'

class Class
  def load_includes
    self::INCLUDES.each do |required|
      required.split('/').loader.require_cascade
    end
  end
end
