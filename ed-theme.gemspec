# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "ed-theme"
  spec.version       = "0.1.0"
  spec.authors       = ["Alex Gil"]
  spec.email         = ["colibri.alex@gmail.com"]

  spec.summary       = "A Jekyll theme for minimal editions"
  spec.homepage      = "http://elotroalex.github.io/ed/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.3"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
