require 'test_helper'
require 'capybara/cuprite'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :cuprite, options: { headless: true }
end
