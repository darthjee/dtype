require './lib/array'

class Class
  def load_includes
    self::REQUIREMENTS.each do |required|
      required.split('/').loader.require_cascade
    end
  end
end
