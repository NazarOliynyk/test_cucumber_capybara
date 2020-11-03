require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'pry'
require 'allure-cucumber'

require 'site_prism'
require 'site_prism/all_there' 


# Capybara.register_driver :site_prism do |app|
#   browser = ENV.fetch('browser', 'chrome').to_sym
#   Capybara::Selenium::Driver.new(app,
#      browser: browser, 
#      :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
#       'chromeOptions' => {'args' => [ "--window-size=1920,1280" ], "excludeSwitches" => ["enable-logging"] }
#     )
#   )
# end

Capybara.register_driver :site_prism do |app|
  browser = ENV.fetch('browser', 'chrome').to_sym
  Capybara::Selenium::Driver.new(app,
    :url => "http://localhost:4444/wd/hub",
     browser: browser, 
     :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
      'chromeOptions' => {'args' => [ "--window-size=1920,1280" ], "excludeSwitches" => ["enable-logging"] }
    )
  )
end

# Capybara.register_driver :site_prism do |app|
#   # browser = ENV.fetch('browser', 'chrome').to_sym
#   caps = Selenium::WebDriver::Remote::Capabilities.new
#   caps["browserName"] = "chrome"
#   caps["browserVersion"] = "86.0.4240.111"
#   Selenium::WebDriver.for(:remote,
#     :url => "http://localhost:4444/wd/hub",
#     :desired_capabilities => caps)
# end

# caps = Selenium::WebDriver::Remote::Capabilities.new
# caps["browserName"] = "UNKNOWN"
# caps["browserVersion"] = ""

# Capybara.register_driver = Selenium::WebDriver.for(:remote,
#   :url => "http://localhost:4444/wd/hub",
#   :desired_capabilities => caps)


Capybara.configure do |config|
  config.default_driver = :site_prism
end



Capybara.default_max_wait_time = 20

Capybara.default_selector = :css

AllureCucumber.configure do |c|
  
  c.results_directory = 'report/allure-results'
  c.tms_prefix      = '@HIPTEST--'
  c.issue_prefix    = '@JIRA++'
  c.severity_prefix = '@URGENCY:'
  c.clean_results_directory = true
  c.logging_level = Logger::INFO

  end

After do |test|
  # if test.failed?
    image = File.open(page.save_screenshot("screen.pnj", full: true))
    Allure.add_attachment(name: "attachment.png", source: image, type: Allure::ContentType::PNG, test_case: true)
  # end
end





