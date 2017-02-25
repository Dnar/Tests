require 'bddfire'

#################__Login to CRM__#################

Given(/^I am on page "([^"]*)"$/) do |path_to|
  page.visit path_to
end

When(/^I fill in field with the text "([^"]*)"$/) do |telephone|
    if page.has_button? 'Выйти'
      page.click_button 'Выйти'
    else
      page.fill_in('phone', with: telephone)
    end
  end

When(/^I click button "([^"]*)"$/) do |button|
  page.click_button button
end

When(/^I should see in result "([^"]*)"$/) do |smstext|
  page.should have_content smstext
end

When(/^I fill in field with sms_code$/) do
  code = JSON.parse(`curl 0.0.0.0:3002/api/support/sms_codes/list_for_phone/79999999999?limit=1`).first['code']
  page.fill_in 'code', with: code
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
  page.fill_in('name', with: cleanerType)
end

When(/^I select element "([^"]*)"$/) do |element|
  page.find('.Select-control').click
  i = page.find('.Select-menu-outer')
  i.first('.Select-option', text: element).click
end

When(/^I press button "([^"]*)"$/) do |add_calltype|
  page.click_button add_calltype
end

Then(/^I should see text "([^"]*)"$/) do |currentText|
  page.should have_content currentText
end



#################__Create new client__#################

When(/^I click button$/) do
  page.click_link('Пользователи')
  page.find('[name=createClient]').click
end

When(/^I fill in fields last name, first name and middle name with the text "([^"]*)", "([^"]*)", "([^"]*)"$/) do |lastname, firstname, middlename|
  @lastname = lastname
  @firstname = firstname
  @middlename = middlename

  page.fill_in 'lastName',   with: lastname
  page.fill_in 'firstName',  with: firstname
  page.fill_in 'middleName', with: middlename
end

When(/^I add in field phone the text "([^"]*)"$/) do |phone|
  page.fill_in 'phone', with: phone
end

When(/^I add in field email the text "([^"]*)"$/) do |email|
  page.fill_in 'email', with: email
  page.save_screenshot('/Users/Dinar/Projects/Tests/cucumber/', full: true)
end

When(/^I check element some elements$/) do
  page.check('receiveMails')
  page.check('vip')
end

When(/^I press button for create user$/) do
   page.find('[name=onSubmit]').click
   if page.has_content? ("Имеет неверное значение" || "Уже существует")
    page.fill_in('phone', with: '79021233543') && page.find('[name=onSubmit]').click
   end
    page.save_screenshot('/Users/Dinar/Projects/Tests/cucumber/', full: true)
end

Then(/^I should see some text in page$/) do
  page.should have_content @firstname
  page.should have_content @middlename
  page.should have_content @lastname
  page.should have_content "Новое обращение"
end

