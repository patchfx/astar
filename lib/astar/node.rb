module Astar
  class Node
    attr_reader :tile, :parent, :destination
    def initialize(tile, destination, parent=nil)
      @tile = tile
      @parent = parent
      @destination = destination
    end

    def walkable_neighbours
      @tile.walkable_neighbours
    end

    def x
      @tile.x
    end

    def y
      @tile.y
    end
  end
end
