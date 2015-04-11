$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "implicit_page_titles/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "implicit_page_titles"
  s.version     = ImplicitPageTitles::VERSION
  s.authors     = ["neilang"]
  s.email       = ["neilang@gmail.com"]
  s.homepage    = "https://github.com/neilang/implicit_page_titles"
  s.summary     = "Smart page title defaults for your Rails app."
  s.description = "Smart page title defaults for your Rails app."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.2.1"
  s.add_development_dependency "rubocop", "~> 0.30.0"
  s.add_development_dependency "capybara", "~> 2.4.4"
end
