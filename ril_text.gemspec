# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ril_text/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["tomykaira"]
  gem.email         = ["tomykaira@gmail.com"]
  gem.description   = %q{A thin wrapper of Read It Later Text API}
  gem.summary       = %q{A thin wrapper of Read It Later Text API}
  gem.homepage      = "https://github.com/tomykaira/ril_text"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ril_text"
  gem.require_paths = ["lib"]
  gem.version       = RilText::VERSION
end
