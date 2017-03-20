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
  code = JSON.parse(
    `curl 0.0.0.0:3002/api/support/sms_codes/list_for_phone/79999999999?limit=1`
    ).first['code']
  page.fill_in 'code', with: code
end

Then(/^I have see in result "([^"]*)"$/) do |pagetextA|
  page.should have_content pagetextA
end



################__Add new CallType for cleaners__#################

When(/^I click link "([^"]*)"$/) do |adminlink|
  page.click_link('Админка')
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
  #page.save_screenshot
  #page.should have_content "Пользователи"
  page.click_link('Пользователи')
  page.find('[name=createClient]').click
end

When(/^I fill in fields last name, first name and middle name with the text "([^"]*)", "([^"]*)", "([^"]*)"$/) do |lastname, firstname, middlename|
  @lastname = lastname
  @firstname = firstname
  @middlename = middlename

  page.fill_in('lastName', with: lastname)
  page.fill_in('firstName',  with: firstname)
  page.fill_in('middleName', with: middlename)
end

When(/^I add in field phone the text "([^"]*)"$/) do |phone|
  page.fill_in 'phone', with: phone
end

When(/^I add in field email the text "([^"]*)"$/) do |email|
  page.fill_in 'email', with: email
  #page.save_screenshot('/Users/Dinar/Projects/Tests/cucumber/', full: true)
end

When(/^I check element some elements$/) do
  page.check('receiveMails')
  page.check('vip')
end

When(/^I press button for create user$/) do
   page.find('[name=onSubmit]').click
   if page.has_content? ("Имеет неверное значение" || "Уже существует")
    page.fill_in('phone', with: '79254446545') && page.find('[name=onSubmit]').click
   end
    #page.save_screenshot
end

Then(/^I should see some text in page$/) do
  page.should have_content @firstname
  page.should have_content @middlename
  page.should have_content @lastname
  page.should have_content "Новое обращение"
  page.should have_content "Группа"
  page.should have_content "Тема"
end



#################__Create new client__#################

When(/^I select element "([^"]*)" in group$/) do |selectGroup|
  page.find('div[name=groupId]>.Select').click
  page.should have_content selectGroup
  page.find('[name="1"]').click
  #page.save_screenshot
end

When(/^I select element "([^"]*)" in theme$/) do |selectTheme|
  page.find('div[name=themeId]>.Select').click
  page.should have_content selectTheme
  #page.save_screenshot
  page.find('[name="126"]').click
end

When(/^I should see in window "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |city, street, number, housing, building, apartment, entrance, intercom, floor|

page.should have_content city
page.should have_content street
page.should have_content number
page.should have_content housing
page.should have_content building
page.should have_content apartment
page.should have_content entrance
page.should have_content intercom
page.should have_content floor
end

When(/^I add in field city with text "([^"]*)"$/) do |city|
  @city = city
  page.find('div[name=cityId]>.Select').click
  page.should have_content city
  page.find('[name="1"]').click
end

When(/^I add in field street with text "([^"]*)"$/) do |street|
  @street = street
  page.fill_in('street', with: street)
end

When(/^I add in field number with text "([^"]*)"$/) do |number|
  @number = number
  page.fill_in('number', with: number)
end

When(/^I add in field housing with text "([^"]*)"$/) do |housing|
  @housing = housing
  page.fill_in('housing', with: housing)
end

When(/^I add in field building with text "([^"]*)"$/) do |building|
  @building = building
  page.fill_in('building', with: building)
end

When(/^I add in field apartment with text "([^"]*)"$/) do |apartment|
  @apartment = apartment
  page.fill_in('apartment', with: apartment)
end

When(/^I add in field entrance with text "([^"]*)"$/) do |entrance|
  @entrance = entrance
  page.fill_in('entrance', with: entrance)
end

When(/^I add in field intercom with text "([^"]*)"$/) do |intercom|
  @intercom = intercom
  page.fill_in('intercom', with: intercom)
end

When(/^I add in field floor with text "([^"]*)"$/) do |floor|
  @floor = floor
  page.fill_in('floor', with: floor)
end

# When(/^I add in field comment with text "([^"]*)"$/) do |comment|
#   page.fill_in('comment', with: comment)
#   page.save_screenshot
# end

When(/^I click "([^"]*)"$/) do |add_address|
  page.click_button(add_address)
  sleep 5
end

Then (/^I shoul see full address in card$/) do
  sleep 3
  page.save_screenshot
  page.should have_content "#{@city}," + " " + "#{@street} улица," + " " + "д. #{@number}," + " " + "корп. #{@housing}," + " " + "стр. #{@building}," + " " + "кв. #{@apartment},"
  #  + "пд. #{@entrance}," + " " + "код #{@intercom}," +
  # + "эт. #{@floor}"
  # page.should have_content @street
  # page.should have_content @number
  # page.should have_content @housing
  # page.should have_content @building
  # page.should have_content @apartment
  # page.should have_content @entrance
  # page.should have_content @intercom
  # page.should have_content @floor
end
