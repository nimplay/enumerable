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

class MyList
  include MyEnumerable
  def initialize(*list)
    @list = list
  end

  def each
    (0...@list.length).each do |item|
      yield @list[item]
    end
  end
end

list = MyList.new(1, 2, 3, 4)

# Test #all?
list.all? { |e| e < 5 }
# true
list.all? { |e| e > 5 }
# false
# Test #any?
list.any? { |e| e == 2 }
# true
list.any? { |e| e == 5 }
# false
# Test #filter
list.filter(&:even?)
# [2. 4]
