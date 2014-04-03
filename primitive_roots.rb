def phi(n)
  arr = []
  arr2 = []
  arr3 = []
  arr4 = []
  arr.push(1)
  for i in 2..n
    if n % i != 0
      if arr2 == []
        arr.push(i)
      else
        arr2.each do |v|
          if i % v == 0
            arr3.push(i)
          else
            arr4.push(i)
          end
        end
        if arr3 == []
          arr.push(i)
        elsif arr3 == [] && arr4 != []
          arr.push(i)
        else
          arr2.push(i)
        end
      end
    else
      arr2.push(i)
    end
    arr3.clear
    arr4.clear
  end
  # p "#{n} = #{arr}"
  return arr
end

def test(a, n)
  arr = []
  b = n - 1
  for i in 2..b
    arr.push([])
    a.each_with_index do |v, index|
      arr[i - 2][index] = i ** v
    end
  end
  # p arr
  return arr
end

def test2(x, n)
  x.each do |v|
    v.map! do |sub_v|
      sub_v % n
    end
  end
end

def test3(x)
  arr = []
  x.each_with_index do |v, index|
    if v == v.uniq
      arr.push(index + 2)
    end
  end
  # p arr
  return arr
end

# i = 9
# p test2(test(phi(i), i), i)

for i in 1..1000
  a = test3(test2(test(phi(i), i), i))
  if a != []
    p "#{i} = #{a.length}"
  end
end

# test3(test2(test(phi(73), 73), 73))
# test2(test(phi(7), 7), 7)
# test(phi(7), 7)