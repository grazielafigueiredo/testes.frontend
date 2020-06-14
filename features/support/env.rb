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

World(Capybara::DSL)
World(Capybara::RSpecMatchers)

# Selenium::WebDriver::Chrome.driver_path = 'C:\Users\Graziela\Downloads\primeiro_projeto\chromedriver_win32\chromedriver'

# Capybara.register_driver :selenium do |app|
#     profile = Selenium::WebDriver::Firefox::Profile.new
#     profile.native_events = true
#     Capybara::Selenium::Driver.new(
#         app,
#         :browser => :firefox, profile: profile
#         )
#     Capybara::Selenium::Driver.new(
#         app,
#         browser: :chrome,
#         desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
#             'chromeOptions' => {'args' => [
#                 '--disable-infobars','window-size=1600,1024'
#                 ]}
#         )
#     )
# end
Capybara.register_driver :site_prism do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :site_prism
  Capybara.page.driver.browser.manage.window.maximize
  config.default_max_wait_time = 10
  config.app_host = 'https://qa2.lottocap.com.br'

  # config.before(:example) do 
  #   page.current_windown.resize_to(1280, 800)
  # end
end
