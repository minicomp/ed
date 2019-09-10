# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "ed."
  spec.version       = "1.0.3"
  spec.authors       = ["Alex Gil", "Karl Stolley"]
  spec.email         = ["colibri.alex@gmail.com", "karl.stolley@gmail.com"]

  spec.summary       = "A Jekyll theme for minimal editions"
  spec.description   = "Ed is a Jekyll theme designed for textual editors based on minimal computing principles, and focused on legibility, durability, ease and flexibility."
  spec.homepage      = "http://minicomp.github.io/ed/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|optional|_layouts|_includes|_sass|_texts|index|search|about|credits|documentation|atom|Gemfile|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.6"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.4"
end
