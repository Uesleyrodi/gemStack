require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  #config.default_driver = :selenium_chrome_headless # => com esse comando vc utiliza com o chrome desligado
  config.default_max_wait_time = 5 #configurando o time out da página para que o capybara possa pegar o elemento
end
