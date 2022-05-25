namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Excluindo DB...")
      spinner.auto_spin
      %x(rails db:drop)
      spinner.success("(Concluido!)")
      spinner = TTY::Spinner.new("[:spinner] Criando...")
      spinner.auto_spin
      %x(rails db:create)
      spinner.success("(Concluido!)")
      spinner = TTY::Spinner.new("[:spinner] Migrando...")
      spinner.auto_spin
      %x(rails db:migrate)
      spinner.success("(Concluido!)")
      spinner = TTY::Spinner.new("[:spinner] Semeando...")
      spinner.auto_spin
      %x(rails db:seed)
      spinner.success("(Concluido!)")
    else
      puts "Você não está em ambiente desenvolvimento!"
    end
  end

end
