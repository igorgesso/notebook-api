namespace :dev do
  desc "Configura o Ambiente de Dev"
  task setup: :environment do

    puts "Cadastrando os tipos de contatos..."
    
    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Cadastrados os tipos de contatos"

    puts "Cadastrando os contatos..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name ,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(18, 65),
        kind: Kind.all.sample
      )
    end
    puts "Cadastrados os contatos"
  end

end
