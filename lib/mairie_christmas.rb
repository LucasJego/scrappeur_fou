require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'





def get_townhall_email(townhall_url)

	page = Nokogiri::HTML(open(townhall_url)) 

	return email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]/text()').text

end




def get_townhall_urls

	# on dit au programme d'aller chercher le xpath correspondant au lien de chaque maire

	page = Nokogiri::HTML(open('https://www.annuaire-des-mairies.com/val-d-oise.html'))
	#townhall_url = page.xpath('//*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[1]').text
	townhall_url = page.xpath('//a[@class = "lientxt"]')
	
	townhall_url_array = []
	townhall_url.each do |balise_a_html|
		townhall_url_array << "https://www.annuaire-des-mairies.com/#{balise_a_html['href']}"
	end

	return townhall_url_array

end



def perform

	email_array = []
	get_townhall_urls.each do |url|
		email_array << get_townhall_email(url)
	end

	return email_array


end

puts perform
