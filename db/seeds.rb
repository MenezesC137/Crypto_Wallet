# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Criando Moedas..."

coins = [
  {    
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png"
  },
  {
    description: "Etherium",
    acronym: "ETH",
    url_image: "https://marcas-logos.net/wp-content/uploads/2020/03/ETHEREUM-LOGO.png"
  },
]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
end

puts "Moedas Criadas com sucesso!"