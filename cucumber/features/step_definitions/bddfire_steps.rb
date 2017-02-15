require 'bddfire'

#################__Login to CRM__#################

Given(/^I am on page "([^"]*)"$/) do |path_to|
  page.visit path_to
end

When(/^I fill in field with the text "([^"]*)"$/) do |telephone|
    if page.has_button? 'Выйти'
      page.click_button 'Выйти'
    else
      page.fill_in('phone', :with => telephone)
    end
  end

When(/^I click button "([^"]*)"$/) do |button|
  page.click_button button
end

When(/^I should see in result "([^"]*)"$/) do |smstext|
  page.should have_content smstext
end

When(/^I fill in field with sms_code$/) do
  page.fill_in 'code', :with => JSON.parse(`curl 0.0.0.0:3002/api/support/sms_codes/list_for_phone/79999999999?limit=1`).first['code']
end

Then(/^I have see in result "([^"]*)"$/) do |pagetext|
  page.should have_content pagetext
end

#################__Add new CallType for cleaner__#################

When(/^I click link "([^"]*)"$/) do |adminlink|
  page.click_link adminlink
  page.should have_content 'Тип пользователя'
  page.should have_content 'Название'
  page.should have_content 'Родитель'
end

When(/^I add in field the text "([^"]*)"$/) do |calltype|
  page.fill_in('name', :with => calltype)
  page.save_screenshot
end

When(/^I select element "([^"]*)"$/) do |element|
  #page.should have_selector 'parent'
  page.select element, :from => 'parent'
end

When(/^I press button "([^"]*)"$/) do |add_calltype|
  page.click_button add_calltype
end

Then(/^I should see text "([^"]*)"$/) do |currentText|
  browser.status_code(201)
  page.should have_content currentText
end





