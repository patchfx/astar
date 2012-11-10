module Astar
  class EuclidianDistance < Heuristic
    def score
      f = relative_to_parent
      g = Math.sqrt((@node.destination.x - @node.x)^2 + (@node.destination.y - @node.y)^2)
      f + g
    end
  end
end
