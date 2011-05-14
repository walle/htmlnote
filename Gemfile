source 'http://rubygems.org'

gem 'rails', '3.1.0.beta1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# Asset template engines
gem 'sass'
gem 'coffee-script'
gem 'uglifier'

gem 'jquery-rails'

group :development do
  gem 'unicorn'
  gem 'ruby-debug19', :require => 'ruby-debug'
end

group :development, :test do 
  gem 'rspec-rails' 
end

group :test do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-livereload'
  
  if RUBY_PLATFORM =~ /linux/i
    gem 'rb-inotify'
    gem 'libnotify'
  end

  gem 'turn', :require => false
end
