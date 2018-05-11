require "cucumber"
require "httparty"
require "httparty/request"
require "httparty/response/headers"
require "faker"
require "rspec"
require "cpf_faker"
require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'

Capybara.configure do |config|
    config.default_driver = :chrome
    config.app_host = 'https://conta-sandbox.moip.com.br/'
end
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.javascript_driver = :Selenium
Capybara.default_max_wait_time = 5