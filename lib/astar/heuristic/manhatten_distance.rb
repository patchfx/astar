module Astar
  class ManhattenDistance < Heuristic
    def score
      f = relative_to_parent
      g = (@node.destination.x - @node.x).abs + (@node.destination.y - @node.y).abs
      f + g
    end
  end
end
