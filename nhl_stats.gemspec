
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nhl_stats/version'
require 'nhl_stats/player'
require 'nhl_stats/scraper'
require 'nhl_stats/cli'


Gem::Specification.new do |spec|
  spec.name          = "nhl_stats"
  spec.version       = NHLStats::VERSION
  spec.authors       = ["Brian Nicholls"]
  spec.email         = ["nichol88@gmail.com"]

  spec.summary       = %q{Simple gem to display NHL stats.}
  spec.description   = %q{Scrapes quanthockey.com}
  spec.homepage      = "http://github.com/nichol88/nhl_stats"
  spec.license       = "MIT"


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = 'nhl-stats' #spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.files         = [
    "./lib/nhl_stats.rb", "./lib/nhl_stats/player.rb", "./lib/nhl_stats/scraper.rb",
    "./lib/nhl_stats/cli.rb", "bin/nhl-stats", "./lib/nhl_stats/version.rb"
  ]

  spec.add_development_dependency "bundler", "~> 2.1.2"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "watir"
  spec.add_dependency "nokogiri", ">= 1.10.7", "< 1.14.0"
  spec.add_development_dependency "pry", "~> 0.12.2"

end
