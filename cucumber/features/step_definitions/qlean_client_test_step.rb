require 'bddfire'
require 'open-uri'
require 'nokogiri'

#################__Login to Qlean__#################

Given(/^I am on qlean page$/) do
  @home_page = HomePage.new(Capybara.current_session)
  @home_page.visit_home_page
end


When(/^I change room and bathroom$/) do
  @phone = '7' + '9' + 9.times.map { rand(10) }.join

  page.should have_content 'Расскажите о квартире'
  f = page.first('form[data-test-id="orderCreationForm"]')
  f.find('[data-test-id="counterDecrementButton.serviceId1"]').click
  f.should have_content '1-комнатная'
  f.fill_in('phone', :with => @phone)
  f.find('[data-test-id="orderCreationForm.submitButton"]').click
  sleep 2
end

When(/^I fill in popup field with sms_code$/) do
    url = 'http://localhost:3000/admin/sms_codes'
    html = open(url)
    code = Nokogiri::HTML(html).css('tbody tr:first td:nth-child(2)').text

    page.save_screenshot

    if page.has_field?('code')
      page.fill_in('code', :with => code)
    else
      puts 'first order'
    end
  end

When(/^I should see some text$/) do
    if current_url.split('/').last == 'additional'
      puts 'success'
    else
      puts "Error"
    end
  page.should have_content 'Оформление заказа'
  page.should have_content 'Адрес квартиры'
  page.should have_content 'Когда к вам приехать'
  page.should have_content 'Способ оплаты'
  page.should have_content 'Уборка квартиры c 1 жилой и 1 ванной комнатой'
end
