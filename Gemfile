source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "1.5.6"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.4"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire"s SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire"s modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 5.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# CSS Bundling
gem "cssbundling-rails", "~> 1.4"

# A framework for building reusable, testable & encapsulated view components in Ruby on Rails.
# https://github.com/viewcomponent/view_component
gem "view_component"

# Add Haml template engine to Rails
gem "haml-rails", "~> 2.0"

# Fixtures replacement with a straightforward definition syntax
gem "factory_bot_rails"

# Gem for SVG import & styling via CSS
gem "inline_svg", "~> 1.9.0"

# DRY Parameters for your controllers
gem "dry-schema", "~> 1.13.3"

# Money Currency made easy
# https://github.com/RubyMoney/money-rails
gem "money-rails", "~> 1.15"

# State-Machine logic for Ruby, compatible with ActiveRecord
# https://github.com/state-machines/state_machines
gem "aasm", "5.5.0"

# Allows defining ActiveRecord callbacks anywhere outside of Model classes
# https://github.com/Envek/after_commit_everywhere
gem "after_commit_everywhere", "~> 1.4.0"

# Gem to generate URLs to attach calendar events to emails
# https://github.com/jaredlt/add_to_calendar
gem "add_to_calendar", "~> 0.4.0"

group :development, :test do
  # powerful component browser and preview system with an integrated documentation engine
  gem "lookbook", ">= 2.0.5"

  # Pry is a runtime developer console and IRB alternative with powerful introspection capabilities
  gem "pry"

  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  # Library for generating fake data such as names, addresses, and phone numbers.
  # Helps you generate realistic test data.
  gem "faker"

  ## Linter Gems
  # Ruby static code analyzer (a.k.a. linter) and code formatter.
  gem "rubocop", "~> 1.62", require: false
  # A RuboCop extension focused on enforcing Rails best practices and coding conventions.
  gem "rubocop-rails", require: false
  # Performance optimization analysis for your projects, as an extension to RuboCop.
  gem "rubocop-performance", require: false
  # A RuboCop extension focused on enforcing Minitest best practices and coding conventions.
  gem "rubocop-minitest", require: false
  # factory_bot-specific analysis for your projects, as an extension to RuboCop.
  gem "rubocop-factory_bot", require: false
end

group :development do
  # Gem required to debug with RubyMine debugger
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "mocha"

  # Use test helper for most comment test scenarios
  # https://github.com/thoughtbot/shoulda-matchers#minitest
  gem "shoulda-matchers", "~> 6.2"
end
