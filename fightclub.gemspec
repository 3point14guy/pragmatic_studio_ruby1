Gem::Specification.new do |s|
  s.name        = "fightclub"
  s.version     = "1.0.0"
  s.author      = "Pieguy Designs"
  s.email       = "nicholas.piaskoski@gmail.com"
  s.summary     = "fight simulation"
  s.description = File.read(File.join(File.dirname(__FILE__), 'README.md'))
  s.licenses    = ['MIT']
  s.homepage    = "https://nickpie.com"
  s.files       = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README.md)
  s.test_files  = Dir["spec/**/*"]
  s.executables = [ 'fightclub' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 3.8', '>= 3.8.0'
end
