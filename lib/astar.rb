require "astar/heuristic"
require "astar/heuristic/manhatten_distance"
require "astar/heuristic/euclidean_distance"
require "astar/node"
require "astar/version"

module Astar
  class FindPath
    def self.from(node)
      new(node)
    end

    def to(node, strategy=ManhattenDistance)
      @to_node = Node.new(node,nil)
      @open_list << Node.new(@from_node, @to_node)
      @strategy = strategy
      calculate_route
    end

    def calculate_route
      until destination_reached? || @open_list.empty?
        current_node = @open_list.pop
        next if @closed_list.include?(current_node)
        add_neighbours_to_list(current_node, current_node.walkable_neighbours)
        calculate_fastest
        @closed_list << current_node
      end
      @closed_list
    end

    def add_neighbours_to_list(current_node, neighbours)
      nodes = neighbours.map {|n| Node.new(n, @to_node, current_node) }
      @open_list << nodes
      @open_list.flatten!
    end

    def calculate_fastest
      @open_list.sort_by! {|node| @strategy.score(node) }.reverse
    end

    def destination_reached?
      @closed_list.any? { |node| node.x == @to_node.x && node.y == @to_node.y }
    end

    private
    def initialize(node)
      @from_node = Node.new(node, nil)
      @open_list = []
      @closed_list = []
      @strategy = ManhattenDistance
    end
  end
end
