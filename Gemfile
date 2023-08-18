source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.4"
gem "rails", "~> 7.0.7"
gem "pg"
gem "puma", "~> 5.0"
gem 'activerecord_json_validator'
gem 'json_schemer'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem 'rspec', '~> 3.12'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem "pry"
end
