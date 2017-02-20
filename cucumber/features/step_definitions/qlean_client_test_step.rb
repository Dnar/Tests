require 'bddfire'
require 'open-uri'
require 'nokogiri'

#################__Login to Qlean__#################

When(/^I change room and bathroom$/) do
  page.should have_content 'Расскажите о квартире'
  f = page.first('form[data-test-id="orderCreationForm"]')
  f.find('[data-test-id="counterDecrementButton.serviceId1"]').click
  f.should have_content '1-комнатная'
  f.find('[data-test-id="orderCreationForm.submitButton"]').click
end

When(/^I fill in popup field with sms_code$/) do
    url = 'http://localhost:3000/admin/sms_codes'
    html = open(url)
    code = Nokogiri::HTML(html).css('tbody td:nth-child(2)').text

    if page.has_field?('code') #&& page.has_button? "Запросить код повторно"
      page.fil_in('code', with => code)
    else
      
    end
  end

  Then(/^I have see in result$/) do |secondStep|
    page.should have_content secondStep
  end
