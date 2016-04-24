require 'spec_helper'

module Astar
  describe FindPath do
    let(:node) { double(:node, x: 0, y: 0) }
    let(:node2) { double(:node2, x: 1, y: 0) }
    let(:node3) { double(:node3, x: 0, y: 1) }
    let(:node4) { double(:node4, x: 1, y: 1) }

    before do
      expect(node).to receive(:walkable_neighbours) { [node2,node3,node4] }
      expect(node4).to receive(:walkable_neighbours) { [node2,node3,node] }
    end

    context 'manhatten distance' do
      it 'finds the fastest route between 2 nodes' do
        path = FindPath.from(node).to(node4, Astar::ManhattenDistance)
        coords = path.collect { |node| [node.x, node.y] }
        expect(coords).to match_array([[0, 0], [1, 1]])
      end
    end
  end
end
