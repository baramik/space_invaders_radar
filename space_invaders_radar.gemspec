# frozen_string_literal: true

require_relative "lib/space_invaders_radar/version"

Gem::Specification.new do |spec|
  spec.name          = "space_invaders_radar"
  spec.version       = SpaceInvadersRadar::VERSION
  spec.authors       = ["dmitriybaramikov"]
  spec.email         = ["baramik1989@gmail.com"]

  spec.summary       = "A gem for detecting aliens"
  spec.description   = "Find em all"
  spec.homepage      = "https://github.com/baramik/space_invaders_radar"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/baramik/space_invaders_radar"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "levenshtein"
  spec.add_dependency "thor"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
