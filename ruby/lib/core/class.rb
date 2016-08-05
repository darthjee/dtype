require './lib/core/array'

class Class
  def requirements
    if parent == Object
      self::REQUIREMENTS
    else
      self::REQUIREMENTS + parent.requirements
    end
  end

  def parent
    @parent ||= ancestors[1]
  end

  private

  def load_includes
    self::REQUIREMENTS.each do |required|
      required.split('/').loader.require_cascade
    end
  end
end
