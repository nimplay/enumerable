module MyEnumerable
  def list
    @list ||= []
  end

  def all?
    arr = []
    list.each do |e|
      arr.push(e) if yield e
    end
    p arr.length == list.length
  end

  def any?
    arr = []
    list.each do |e|
      arr.push(e) if yield e
    end
    p !arr.empty?
  end

  def filter
    arr = []
    list.each do |e|
      arr.push(e) if yield e
    end
    p arr
  end

  def max
    max_num = 0
    list.each do |e|
      e > max_num ? max_num = e : e
    end
    p max_num
  end

  def min
    min_num = 999
    list.each do |e|
      e < min_num ? min_num = e : e
    end
    p min_num
  end

  def sort
    arr = []
    new_arr = list
    list.length.times do
      orig_arr = list
      item_remove = orig_arr.min
      arr.push(item_remove)
      new_arr = orig_arr.delete(item_remove)
    end
    p arr
  end
end
