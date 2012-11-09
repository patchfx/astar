# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'astar/version'

Gem::Specification.new do |gem|
  gem.name          = "astar"
  gem.version       = Astar::VERSION
  gem.authors       = ["Richard Patching"]
  gem.email         = ["richard@justaddpixels.com"]
  gem.description   = %q{Pathfinding library using the a* algorithm}
  gem.summary       = %q{Pathfinding library}
  gem.homepage      = "http://github.com/patchfx/astar"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
