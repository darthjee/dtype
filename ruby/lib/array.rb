class Array
  def constantize
    join('::').constantize
  end

  def require_class
    require join('/')
  end

  def require_cascade
    inject(['.', 'lib']) do |prev, current|
      prev << current
      prev.require_class if current.match(/\w+/)
      prev
    end
  end

  def require_constantize
    require_cascade
    map(&:camelize).constantize
  end
end
