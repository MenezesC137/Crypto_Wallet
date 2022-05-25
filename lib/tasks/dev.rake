namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?

      show_spinner("Excluindo DB..."){ %x(rails db:drop)}
      show_spinner("Criando..."){ %x(rails db:create)}
      show_spinner("Migrando..."){ %x(rails db:migrate)}
      show_spinner("Semeando..."){ %x(rails db:seed)}
      
    else
      puts "Você não está em ambiente desenvolvimento!"
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
