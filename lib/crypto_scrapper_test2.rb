require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
 
def page  
 page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

end


def find_crypto_name

	#crypto = page.xpath('//*[@id="id-bitcoin"]/td[3]/text()')
	crypto_name = page.xpath('//*[@id]/td[3]/text()')

	# /!\ Ici, le tableau crypto est de la classe Nokogiri::XML::NodeSet et non pas Array!
	# On transforme crypto en un tableau
	crypto_name_array = crypto_name.to_a

	# Les éléments du tableau crypto_name_array sont de la classe Nokogiri::XML::Text et non pas String!
	# On transforme la classe des éléments du tableau en String
	crypto_string_name_array = []
	crypto_name_array.each do |name_cryptocurrency|
		name_cryptocurrency = name_cryptocurrency.to_s
		crypto_string_name_array << name_cryptocurrency
	end

	#return crypto_string_name_array

end

puts find_crypto_name