source 'https://rubygems.org'

ruby "2.4.1"

gem 'babel-transpiler'
gem 'jquery-rails'
gem 'json', '>= 2.0.0'
gem 'pg', '~> 0.18'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'puma', '~> 3.0'
gem 'slim-rails', github: 'y-yagi/slim-rails', branch: 'make_work_with_sprockets_4'
gem 'rails', '5.1.0.rc2'
gem 'ruby-pushbullet', require: 'pushbullet'
gem 'sass-rails'
gem 'sprockets', '~> 4.x'
gem 'sprockets-rails', '~> 3.x'
gem 'turbolinks', '~> 5.x'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'flamegraph'
  gem 'fast_stack'
  gem 'web-console', '~> 3.0'
  gem 'listen', '~> 3.0.5'
  gem 'rack-mini-profiler'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'rails_12factor'
end
