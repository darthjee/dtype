require './lib/utils/loader'

class Array
  def loader
    Utils::Loader.new(self)
  end
end
