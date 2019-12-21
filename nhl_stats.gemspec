
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "nhl_stats"
  spec.version       = NHLStats::VERSION
  spec.authors       = ["Brian Nicholls"]
  spec.email         = ["nichol88@gmail.com"]

  spec.summary       = %q{Simple gem to display NHL stats.}
  spec.description   = %q{Scrapes quanthockey.com}
  #spec.homepage      = "http://github.com/nichol88/nhl_stats"
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
    "lib/nhl_stats.rb", "lib/nhl_stats/player.rb", "lib/nhl_stats/scraper.rb",
    "lib/nhl_stats/cli.rb", "bin/nhl-stats", "lib/nhl_stats/version.rb"
  ]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "nokogiri", "~> 1.10.7"
  spec.add_development_dependency "pry", "~> 0.12.2"
  #spec.add_dependency "nhl_stats"
end
