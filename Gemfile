source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.2'

gem 'rails',          '5.1.4'
gem 'bcrypt',         '3.1.11'
gem 'bootstrap',      '4.0.0.beta'
gem 'jbuilder',       '2.7.0'
gem 'jquery-rails',   '4.3.1'
gem 'puma',           '3.10.0'
gem 'sass-rails',     '5.0.6'
gem 'sprockets-rails', '3.2.1'
gem 'turbolinks',     '5.0.1'
gem 'uglifier',       '3.2.0'
gem 'devise', '~> 4.2'
gem 'rspec'
gem 'stripe'

group :development, :test do
  gem 'sqlite3',     '1.3.13'
  gem 'rspec-rails', '3.6.0'
  gem 'capybara',    '2.15.4'
  gem 'factory_bot_rails'
  gem 'byebug',      '9.1.0', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '3.5.1'
  gem 'listen',      '3.1.5'
  gem 'spring',      '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end

group :production do
  gem 'pg', '0.21.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
