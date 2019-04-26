namespace :dev do
  desc "Configura o Ambiente de Dev"
  task setup: :environment do
    puts "Resetando o banco de dados..."
    %x(rails db:drop db:create db:migrate)

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

    puts "Cadastrados os telefones"
  
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end

    puts "Telefones Cadastrados"

    ##########################

    puts "Cadastrados os endereços"
  
    Contact.all.each do |contact|
      address = Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end

    puts "Endereços Cadastrados"

  end
end
