require 'rubygems'
require 'bundler/setup'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'selenium-webdriver'
require 'axe/cucumber/step_definitions'
require 'bddfire'
require 'rest-client'
require 'capybara-screenshot/cucumber'


Capybara::Screenshot.autosave_on_failure = true
Capybara::Screenshot.webkit_options = { width: 1024, height: 768 }

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = (ENV['DRIVER'] || 'selenium').to_sym
  config.javascript_driver = :poltergeist
  config.default_selector = :css
  config.default_wait_time = 15
  config.ignore_hidden_elements = true
  config.app_host = 'http://localhost:7001'
end


Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  Capybara::Selenium::Driver.new(app, profile: profile)
end

Capybara.register_driver :poltergeist do |app|
  options = {
    js_errors: true,
    timeout: 120,
    debug: false,
    phantomjs_options: ['--load-images=no', '--disk-cache=false'],
    inspector: true

  }

  Capybara::Poltergeist::Driver.new(app, options)
end
