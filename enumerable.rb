module MyEnumerable
  def all?
    each do |x|
      return false unless yield(x)
    end
    true
  end

  def any?
    each do |x|
      return true if yield(x)
    end
    false
  end

  def filter
    filter_value = []
    each do |x|
      filter_value.push(x) if yield(x)
    end
    filter_value
  end
end
