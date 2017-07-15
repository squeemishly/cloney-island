source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'kaminari'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'figaro'
gem 'faraday'
gem "bootstrap_form", github: "bootstrap-ruby/rails-bootstrap-forms" , branch: "bootstrap-v4"
gem 'font-awesome-rails'
gem 'bootstrap-social-rails'

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end


group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'pry-rails'
  gem 'simplecov', :require => false
  gem 'vcr'
  gem 'webmock'
end
