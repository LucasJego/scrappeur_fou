require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
 
def page  
	return page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).text  
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

	return crypto_string_name_array

end



def find_crypto_value

	#currency = page.xpath('//*[@id="id-bitcoin"]/td[5]/a')
	crypto_value = page.xpath('//*[@id]/td[5]/a/text()') # /!\ Les éléments récupérés sur la page web et stockées dans le tableau sont de la classe Nokogiri::XML::Text (et non pas string ou float)!
	crypto_value_array = crypto_value.to_a
	crypto_float_value_array = []

	crypto_value_array.each do |value|
		# Les éléments du tableau currency ont comme classe Nokogiri::XML::Text
		value_string = value.to_s
		# On enlève le symbole "$" présent dans le prix des cryptomonnaies
		value_without_dollar = value_string.delete("$")
		# On transforme la classe de value en float
		value_float = value_without_dollar.to_f
		# On met ces nouvelles valeurs dans un nouveau tableau
		crypto_float_value_array = crypto_float_value_array + [value_float]
	end

	# On retourne ce tableau qui contient des éléments de la classe float
	return crypto_float_value_array

end



def final_array 

	# On créé le tableau final qui contiendra les hashs
	cryptocurrencies_array = []
	# On créé les hash qui contiendront les noms de cryptomonnaies en clé et les valeurs des cryptomonnaies en valeur
	cryptocurrency_hash = {} # Ou : cryptocurrencies_hash = Hash.new

	i = 0

	#while i < find_crypto_name.size do
	while i < 10 do	
		cryptocurrency_hash = {find_crypto_name[i] => find_crypto_value[i]}
		cryptocurrencies_array << cryptocurrency_hash
		i += 1
	end
	
	return cryptocurrencies_array
end

5.times do
	sleep 0.7
	system('clear')
	sleep 0.2
	puts "\t\t[Avis aux innocents moussaillons qui vont me corriger]"
end

#puts "\nMon code étant à chier sur cet exo, l'affichage du tableau contenant les hashs avec le nom des cryptomonnaies et leur valeur est extrêmement long... Pour ne pas vous faire attendre inutilement toute la matinée avant de pouvoir afficher quelque chose, je me suis contenté d'afficher uniquement les 10 premières cryptomonnaies (d'où le while i < 10 dans le code).\n\nToute suggestion pour remédier à ce problème est évidemment la bienvenue!\n\n"


print final_array









