# frozen_string_literal: true

lib = File.expand_path('./lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord/explainer/version'

Gem::Specification.new do |s|
  s.name          = 'activerecord-explainer'
  s.version       = ActiveRecord::Explainer::VERSION
  s.authors       = ['Yoshiyuki Hirano']
  s.email         = ['yhirano@me.com']
  s.homepage      = 'https://github.com/yhirano55/activerecord-explainer'
  s.summary       = %(This gem automatically logs SQL EXPLAIN of every queries)
  s.description   = %(This gem automatically logs SQL EXPLAIN of every queries. You can check naturally every SQL EXPLAIN from development log, without manually executions.)
  s.license       = 'MIT'
  s.files         = Dir.chdir(File.expand_path('.', __dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features|images)/})
    end
  end

  s.bindir        = 'exe'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.2.2'
  s.required_rubygems_version = '>= 1.8.11'

  s.add_dependency 'activerecord', '>= 5.1'
  s.add_dependency 'activesupport', '>= 5.1'

  s.add_development_dependency 'bundler', '~> 2.0'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.0'
end
