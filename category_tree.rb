# This class manages the addition/query of nodes in a tree.
# If adding the root then its parent will be nil
# If adding a child node then its parent must already exist in the tree
# otherwise raise an ArgumentError
#
class CategoryTree

  def initialize()
    @children = []
    @nodes = []
  end

  def add_category(category, parent)
    raise ArgumentError unless parent.nil? || @nodes.include?(parent)
    @children << {category => parent}
    @nodes << category
  end

  def get_children(category)
    raise ArgumentError unless @nodes.include? category
    c = []
    @children.each {|h| c << h.keys[0] if h.values[0] == category }
    return c
  end

end

# Testing the CategoryTree with the following data:
#   A
#  / \
# B   C
#
# So the output for children of A are B,C
#
c = CategoryTree.new
c.add_category('A', nil)
c.add_category('B', 'A')
c.add_category('C', 'A')
puts (c.get_children('A') || []).join(',')
# this one raises an error
#c.add_category('C', 'D')
# this one raises an error
#puts (c.get_children('D') || []).join(',')
