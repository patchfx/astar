module Astar
  class Node
    attr_reader :tile, :parent
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

    def score
      relative_to_parent + manhatten_distance
    end

    def manhatten_distance
      (@destination.x - @tile.x) + (@destination.y - @tile.y)
    end

    def relative_to_parent
      return 10 if (@tile.x > @parent.x && @tile.y == @parent.y)
      return 10 if (@tile.x < @parent.x && @tile.y == @parent.y)
      return 10 if (@tile.y > @parent.y && @tile.x == @parent.x)
      return 10 if (@tile.y < @parent.y && @tile.x == @parent.x)
      14
    end
  end
end
