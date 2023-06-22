class Sum
  attr_accessor:arr
  def initialize(array)
    @arr=array

  end
  def runningSum()
    print "Running Sum"
    sum=0
    for index in  1..10
      sum+=arr[index]
      arr[index]=sum
    end
    return arr
  end
end
array=Array.new
for index in  1..10
  array[index]=rand(10)
end
print("array ")
puts array
obj=Sum.new(array)
puts obj.runningSum

