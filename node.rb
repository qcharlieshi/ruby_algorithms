#node class for a BST

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