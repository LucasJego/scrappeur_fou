require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
 
def page  
	return page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
end



def find_crypto_name

	#crypto = page.xpath('//*[@id="id-bitcoin"]/td[3]/text()')
	crypto_name = page.xpath('//*[@id]/td[3]/text()')

	# /!\ Ici, le tableau crypto est de la classe Nokogiri::XML::NodeSet et non pas Array!
	# On transforme crypto en un tableau
	crypto_name_array = crypto_name.to_a

	# Les éléments du tableau crypto_name_array sont de la classe Nokogiri::XML::Text et non pas String!
	# On transforme la classe des éléments du tableau en String
	crypto_name_array.each do |name_cryptocurrency|
		name_cryptocurrency = name_cryptocurrency.to_s
	end

	#return crypto_name_array

	puts crypto_name_array.size
end


def find_crypto_value

	#currency = page.xpath('//*[@id="id-bitcoin"]/td[5]/a')
	crypto_value = page.xpath('//*[@id]/td[5]/a/text()') # /!\ Les éléments récupérés sur la page web et stockées dans le tableau sont de la classe Nokogiri::XML::Text (et non pas string ou float)!
	crypto_value_array = crypto_value.to_a


	crypto_value_array.each do |value|
		# Les éléments du tableau currency ont comme classe Nokogiri::XML::Text
		value = value.to_s
		# On enlève le symbole "$" présent dans le prix des cryptomonnaies
		value = value.delete("$")
		# On transforme la classe de value en float
		value = value.to_f
	end
	puts crypto_value_array[0].class
	puts crypto_value_array.size
	#return crypto_value_array.size

end



def final_array 

	cryptocurrencies_array = []
	cryptocurrencies_hash = {} # Ou : cryptocurrencies_hash = Hash.new
	

end

puts find_crypto_name
puts find_crypto_value



require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
 
def page  
	return page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
end



def find_crypto_name

	#crypto = page.xpath('//*[@id="id-bitcoin"]/td[3]/text()')
	crypto_name = page.xpath('//*[@id]/td[3]/text()')

	# /!\ Ici, le tableau crypto est de la classe Nokogiri::XML::NodeSet et non pas Array!
	# On transforme crypto en un tableau
	crypto_name_array = crypto_name.to_a

	# Les éléments du tableau crypto_name_array sont de la classe Nokogiri::XML::Text et non pas String!
	# On transforme la classe des éléments du tableau en String
	crypto_name_array.each do |name_cryptocurrency|
		name_cryptocurrency = name_cryptocurrency.to_s
	end

	#return crypto_name_array

	puts crypto_name_array.size
end


def find_crypto_value

	#currency = page.xpath('//*[@id="id-bitcoin"]/td[5]/a')
	crypto_value = page.xpath('//*[@id]/td[5]/a/text()') # /!\ Les éléments récupérés sur la page web et stockées dans le tableau sont de la classe Nokogiri::XML::Text (et non pas string ou float)!
	crypto_value_array = crypto_value.to_a


	crypto_value_array.each do |value|
		# Les éléments du tableau currency ont comme classe Nokogiri::XML::Text
		value = value.to_s
		# On enlève le symbole "$" présent dans le prix des cryptomonnaies
		value = value.delete("$")
		# On transforme la classe de value en float
		value = value.to_f
	end
	puts crypto_value_array[0].class
	puts crypto_value_array.size
	#return crypto_value_array.size

end



def final_array 

	cryptocurrencies_array = []
	cryptocurrencies_hash = {} # Ou : cryptocurrencies_hash = Hash.new
	

end

puts find_crypto_name
puts find_crypto_value



