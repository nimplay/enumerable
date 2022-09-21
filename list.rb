require_relative 'enumerable'

class MyList
  include MyEnumerable

  def init(*list)
    @list = list
  end
end

# New list
list = MyList.new(1, 2, 3, 4)

# Test all?
list.all? { |e| e > 5 }
list.all? { |e| e < 5 }

# Test any?
list.any? { |e| e == 5 }
list.any? { |e| e == 2 }

list.filter(&:even?)
list.sort
list.max
list.min
