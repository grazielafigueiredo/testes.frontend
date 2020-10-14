# frozen_string_literal: true

require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'cpf_utils'
require 'faker'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'version'
require 'tiny_tds'

require_relative 'env'
require_relative 'databases/transfer_DB'


World(Capybara::DSL)
World(Capybara::RSpecMatchers)

Capybara.register_driver :site_prism do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :selenium_chrome_headless_docker_friendly do |app|
  Capybara::Selenium::Driver.load_selenium
  browser_options = ::Selenium::WebDriver::Chrome::Options.new
  # browser_options.args << '--headless'
  # browser_options.args << '--disable-gpu'
  # browser_options.args << '--start-maximized'
  browser_options.args << '--enable-features=NetworkService,NetworkServiceInProcess'
  # Sandbox cannot be used inside unprivileged Docker container
  browser_options.args << '--no-sandbox'
  browser_options.args << '--disable-dev-shm-usage'
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium_chrome_headless_docker_friendly 
  config.javascript_driver = :selenium_chrome_headless_docker_friendly
  Capybara.page.driver.browser.manage.window.maximize
  config.default_max_wait_time = 10
  config.app_host = 'https://dev1.lottocap.com.br'
end
