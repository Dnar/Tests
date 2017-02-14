require 'bddfire'

Given(/^I am on page "([^"]*)"$/) do |path_to|
  page.visit path_to
  page.save_screenshot
end

When(/^I fill in field with the text "([^"]*)"$/) do |telephone|
  sleep 20
  page.save_screenshot
  page.fill_in('phone', :with => telephone)
end

When(/^I click button "([^"]*)"$/) do |button|
  page.click_button button
end

When(/^I should see in result "([^"]*)"$/) do |string|
  page.should have_content string
end

When(/^i fill in field with sms_code$/) do
  page.fill_in 'code', :with => JSON.parse(`curl 0.0.0.0:3002/api/support/sms_codes/list_for_phone/79999999999?limit=1`).first['code']
end

Then(/^I have see in result "([^"]*)"$/) do |string1|
  page.should have_content string1
end
