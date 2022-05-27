namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?

      show_spinner("Excluindo DB..."){ %x(rails db:drop)}
      show_spinner("Criando..."){ %x(rails db:create)}
      show_spinner("Migrando..."){ %x(rails db:migrate)}
      %x(rails dev:add_mining)
      %x(rails dev:add_coins)
      
    else
      puts "Você não está em ambiente desenvolvimento!"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas") do
      coins = [
        {    
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://imagensemoldes.com.br/wp-content/uploads/2020/09/Imagem-Dinheiro-Bitcoin-PNG.png",
          mining_type: MiningType.find_by(acronym: "PoW")
        },
        {
          description: "Etherium",
          acronym: "ETH",
          url_image: "https://marcas-logos.net/wp-content/uploads/2020/03/ETHEREUM-LOGO.png",
          mining_type: MiningType.all.sample
        },
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastra as tipos de mineração"
  task add_mining: :environment do
    show_spinner("Cadastrando mineração") do
      mining_types = [
        {    
          name: "Proof of Stake",
          acronym: "PoS",
        },
        {
          name: "Proof of Work",
          acronym: "PoW",
        },
        {
          name: "Proof of Capacity",
          acronym: "PoC",
        },
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

  def show_spinner(msg_start)
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(Concluido!)")
  end
end
