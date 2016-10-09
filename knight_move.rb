require_relative 'bst'


a1 = [5, 7, 2]

binary_tree = BST.new()
binary_tree.build_tree(a1)
puts binary_tree.to_s
