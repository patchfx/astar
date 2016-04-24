# Astar

Pathfinding library using the astar algorithm, supports manhhaten and euclidean
distance heuristics.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'astar'
```

And then execute:

```ruby
bundle
```

Or install it yourself as:

```ruby
gem install astar
```

## Usage

Make sure you have an object that responds to methods x,y and walkable_neighbours

```ruby
class Tile
  attr_reader :x, :y

  #returns the surrounding tiles that are walkable
  def walkable_neighbours
  end
end
```

Pass in your start and destination tiles

```ruby
Astar::FindPath.from(tile1).to(tile3)
=> [tile1, tile2, tile3]
```

```ruby
Astar::FindPath.from(tile1).to(tile, EuclidianDisance)
```

The specs also have an example of how to use the lib.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
