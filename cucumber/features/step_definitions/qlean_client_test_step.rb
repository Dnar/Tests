require 'bddfire'

#################__Login to Qlean__#################

When(/^I change room and bathroom$/) do
  page.should have_content 'Расскажите о квартире'
  f = page.first('form[data-test-id="orderCreationForm"]')
  f.find('[data-test-id="counterDecrementButton.serviceId1"]').click
  f.should have_content '1-комнатная'
  f.click_button('Рассчитать стоимость')
  #page.save_screenshot
end

When(/^I should see in popup "([^"]*)"$/) do |arg1|
  
  if page.has_button? "Запросить код повторно" && page.has_field?('code')
    page.fill_in('code', :with => sms_code)

  end
end

When(/^I fill in popup field with sms_code$/) do

end
