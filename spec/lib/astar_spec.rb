require 'spec_helper'

module Astar
  describe FindPath do
    let(:node) { double(:node, x: 0, y: 0) }
    let(:node2) { double(:node2, x: 1, y: 0) }
    let(:node3) { double(:node3, x: 0, y: 1) }
    let(:node4) { double(:node4, x: 1, y: 1) }

    before do
      node.stub(:walkable_neighbours => [node2,node3,node4])
      node2.stub(:walkable_neighbours => [node,node3,node4])
      node3.stub(:walkable_neighbours => [node,node2,node4])
      node4.stub(:walkable_neighbours => [node2,node3,node])
    end

    it 'finds the fastest route between 2 nodes' do
      path = FindPath.from(node).to(node4)
      coords = path.collect { |node| [node.x, node.y] }
      coords.should == [[0, 0], [1, 1]]
    end
  end
end
