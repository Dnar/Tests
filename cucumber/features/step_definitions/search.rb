require 'bddfire'


#################__Create new call for client__#################


When(/^I fill searchfield with the text "([^"]*)"$/) do |searchData|
  page.save_screenshot
  page.should have_content "Пользователи"
end

When(/^I click result for open user card$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I have see in result some content$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
