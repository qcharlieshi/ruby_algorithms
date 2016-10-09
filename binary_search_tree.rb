#Not using a class for BST

class Node
  attr_accessor :value, :parent, :left_child, :right_child

  def initialize(value, parent = nil)
    @value = value
    @parent = parent
  end

  def to_s
    if @parent == nil
      print "The value is: #{@value}"
    else
      print "The value is: #{@value}, the parent value is: #{@parent.value}"
    end
  end

end

#Node = Struct.new(value: nil, parent: nil, left_child: nil, right_child: nil)


def build_tree(array)
  btsArray = []
  
  array.each_with_index do |e, index|
    if index == 0
      btsArray.push(node = Node.new(e))
    else
      parentNode = compare(btsArray[0], e)
      btsArray.push(node = Node.new(e, parentNode))
      puts parentNode.class
      puts "Value being pushed is #{e}"
      if parentNode.class != nil
        if parentNode.value > e
          parentNode.left_child = btsArray[btsArray.length - 1]
        elsif parentNode.value < e
          parentNode.right_child = btsArray[btsArray.length - 1]
          #puts "This is the set: #{btsArray[btsArray.length - 1].value}"
        end
      end
    end
  end
  
  return btsArray
  #array[array.length/2]
end

def compare(node, value)
  if (value > node.value) && (node.right_child == nil)
    return node
  elsif (value < node.value) && (node.left_child == nil)
    #puts "this is it #{node.value}"
    return node
  elsif (value > node.value)
    #puts "Comparing #{value} and #{node.value}"
    #puts node.class
    return compare(node.right_child, value)
  elsif (value < node.value)
    #puts "Comparing #{value} and #{node.value}"
    #puts "this is it #{node.left_child.class}"
    return compare(node.left_child, value)
  end
end

def depth_first_search(node, value)
  if node.value > value
    depth_first_search(node.left_child, value) if node.left_child != nil
    return false
  elsif node.value < value
    depth_first_search(node.right_child, value) if node.right_child != nil
    return false
  elsif node.value == value
    return true
  else
    return false
  end
end

def breadth_first_search(node, value)
  queArray = []
  queArray.unshift(node)

  while queArray.empty? == false
    if queArray[0].value == value
      return true
    else
      queArray.push(queArray[0].left_child) if queArray[0].left_child != nil
      queArray.push(queArray[0].right_child) if queArray[0].right_child != nil

      queArray.shift
    end
  end

  return false
end




a1 = [5, 7, 2, 10, 15, 1, 3]

newArray = build_tree(a1)
#puts newArray[0].left_child.value
#puts newArray[0].right_child.value
puts newArray
puts newArray[2].right_child.value
#puts depth_first_search(newArray[0], 4)
puts breadth_first_search(newArray[0], 1)