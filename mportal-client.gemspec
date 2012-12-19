# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = "mportal-client"
  gem.version       = File.read(File.expand_path("../VERSION", __FILE__)).chomp
  gem.authors       = ["znm", "gxw"]
  gem.email         = ["sunteya@gmail.com", "alphaguoxiongwei@gmail.com"]
  gem.description   = %q{a gem for fetch the data}
  gem.summary       = %q{a gem for fetch the data}
  gem.homepage      = "https://wido.me"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_runtime_dependency "httparty"
  gem.add_runtime_dependency "activesupport", "~> 3.2.2"
  gem.add_runtime_dependency "kaminari"
  
  
  gem.add_development_dependency "rake"
  gem.add_development_dependency "version"
  
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "fakeweb"
end
