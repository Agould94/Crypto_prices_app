# frozen_string_literal: true

require_relative "lib/crypto_prices/version"

Gem::Specification.new do |spec|
  spec.name          = "crypto_prices"
  spec.version       = CryptoPrices::VERSION
  spec.authors       = ["Alexander Gould"
  spec.email         = ["alexander.gould94@gmail.com"]

  spec.summary       = "This is a CLI cryptocurrency tracker and portfolio."
  spec.homepage      = "https://github.com/Agould94/Crypto_prices_app"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

   
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
