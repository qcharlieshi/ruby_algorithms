require_relative 'node'

class BST
  attr_reader :root
  attr_accessor :btsArray

  def initialize(root_node = nil)
    if root_node != nil
      @root = root_node
      @btsArray = [@root]
    else
      @btsArray = []
    end
  end

  def build_tree(array)
    array.each_with_index do |e, index|
      if index == 0
        @root = Node.new(e)
        @btsArray[0] = @root
      else
        self.add(node = Node.new(e))
      end
    end
  end

  def add(node)
    parentNode = find_parent(@root, node)
    node.parent = parentNode

    if parentNode.class != nil
      if parentNode.value > node.value
        parentNode.left_child = node
      elsif parentNode.value < node.value
        parentNode.right_child = node
      end
    end

    @btsArray.push(node)
  end

  def find_parent(node, value)
    if (value.value > node.value) && (node.right_child == nil)
      return node
    elsif (value.value < node.value) && (node.left_child == nil)
      return node
    elsif (value.value > node.value)
      return find_parent(node.right_child, value)
    elsif (value.value < node.value)
      return find_parent(node.left_child, value)
    end
  end

  def depth_first_search(value)
    if @root.value == value
      return true
    elsif @root.value > value
      return true if depth_helper(@root.left_child, value)
    elsif @root.value < value
      return true if depth_helper(@root.right_child, value)
    else
      return false
    end
  end

  def depth_helper(node, value)
    if node.value > value
      depth_helper(node.left_child, value) if node.left_child != nil
      return false
    elsif node.value < value
      depth_helper(node.right_child, value) if node.right_child != nil
      return false
    elsif node.value == value
      return true
    end
  end





  def to_s
    @btsArray.each { |e| e }
  end


end



=begin
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
=end



