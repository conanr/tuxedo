source 'https://rubygems.org'

gem 'cane'

if RUBY_VERSION >= '1.9.2'
  gem 'reek', :git => "git://github.com/mvz/reek.git", :branch => "ripper_ruby_parser-2"
else
  gem 'reek'
end

group :developement, :test do
  gem 'rake'
  gem 'rspec'
  gem 'fabrication'
end
