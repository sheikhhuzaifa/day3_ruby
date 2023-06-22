class Frequency
  attr_accessor :arr,:freq
  def initialize(array)
    @arr=array
    @freq=Hash.new(0)
  end
  def findfrequncy()
    for index in  0..10
      freq[arr[index]]+=1
    end
    return freq
  end
end
array=Array.new
for index in  0..10
  array[index]=rand(10)
end
print("array ")
puts array
obj=Frequency.new(array)
print("frequency ")
puts obj.findfrequncy



