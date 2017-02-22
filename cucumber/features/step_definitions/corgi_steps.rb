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

#################__Add new CallType for cleaners__#################

When(/^I click link "([^"]*)"$/) do |adminlink|
  page.click_link adminlink
  page.should have_content 'Тип пользователя'
  page.should have_content 'Название'
  page.should have_content 'Родитель'
end

When(/^I add in field the text "([^"]*)"$/) do |cleanerType|
  page.fill_in('name', :with => cleanerType)
end

When(/^I select element "([^"]*)"$/) do |element|
  page.find('.Select-control').click
  i = page.find('.Select-menu-outer')
  i.first('.Select-option', :text => element).click
end

When(/^I press button "([^"]*)"$/) do |add_calltype|
  page.click_button add_calltype
end

Then(/^I should see text "([^"]*)"$/) do |currentText|
  page.should have_content currentText
end

#################__Create new client__#################

When(/^I click button$/) do
  page.find_button('Новый клиент').click
end

When(/^I add in field last name the text "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I add in field first name the text "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I add in field middle name the text "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I add in field phone the text "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I add in field email the text "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I check element some elements$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I press button for create user$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see some text in page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

