# Copyright (c) 2018 Danil Pismenny <danil@brandymint.ru>

# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'import/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby-import'
  spec.version       = Import::VERSION
  spec.authors       = ['Danil Pismenny']
  spec.email         = ['danil@brandymint.ru']

  spec.summary       = 'ES7 style modules importing in Ruby.'
  spec.description   = 'No litter global namespace, no states, no mixins.'
  spec.homepage      = 'https://github.com/dapi/ruby-import'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/dapi/ruby-import'
  spec.metadata['changelog_uri'] = 'https://github.com/dapi/ruby-import/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'guard', '~> 2.15'
  spec.add_development_dependency 'guard-ctags-bundler', '~> 1.4'
  spec.add_development_dependency 'guard-minitest', '~> 2.4'
  spec.add_development_dependency 'guard-rubocop', '~> 1.3'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.74.0'
end
