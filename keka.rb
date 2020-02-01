# frozen_string_literal: true

require 'watir'
require 'pry'


class Keka
  EMAIL       = 'john@doe.com'
  PASSWORD    = 'password'
  URL         = 'https://changeme.keka.com/ui/#'

  def start
    browser = Watir::Browser.new

    browser.goto("#{URL}/home/dashboard")

    browser.input(id: "email").send_keys(EMAIL)
    browser.input(id: "password").send_keys(PASSWORD)
    browser.button(text: 'Login').click

    browser.goto("#{URL}/me/attendance/logs")
    sleep(15)
    if browser.a(:text => 'Web Clock-In').exist?
      browser.a(:text => 'Web Clock-In').click
    elsif browser.button(:text => 'Web Clock-out').exist?
      browser.button(text: 'Web Clock-out').click
      browser.button(text: 'Clock-out').click
    end
    sleep(5)
    browser.quit
  end
end

Keka.new.start




