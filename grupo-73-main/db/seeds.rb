# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# NICOLE
user1 = User.create!(
    #encrypted_password: Faker::Alphanumeric.alphanumeric(number: 10),
    email: "nfmarin@uc.cl",
    password: 123456789,
    #reset_password_token: "a",
    
    #reset_password_sent_at: Faker::Time.backward(days: 14, period: :all),
    #remember_created_at: Faker::Time.backward(days: 14, period: :all),
    
    #created_at: Faker::Time.backward(days: 14),
    #pdated_at: Faker::Time.backward(days: 14),
    phone: 30568217,
    name: "Nicole",
    last_name: "Marin",
    patent: "xxxxxx",
    car_color: "rosado",
    description: "Soy...",
    stars: 5,
    image: 1010101,
    is_admin: false
)

    
# SOFIA
user2 = User.create!(
    #encrypted_password: Faker::Alphanumeric.alphanumeric(number: 10),
    email: "sofiamm@uda.cl",
    password: 12345678,
    #reset_password_token: "a",
    
    #reset_password_sent_at: Faker::Time.backward(days: 14, period: :all),
    #remember_created_at: Faker::Time.backward(days: 14, period: :all),
    
    #created_at: Faker::Time.backward(days: 14),
    #pdated_at: Faker::Time.backward(days: 14),
    phone: 36668217,
    name: "Sofia",
    last_name: "Marin",
    patent: "xxxxxx",
    car_color: "azul",
    description: "Soy...",
    stars: 4,
    image: 101011,
    is_admin: false
    )

# NICOLE HACE TURNO1
turn1 = Turn.create!(
    name: "COPIAPO-SANTIAGO",
    max_space: 5,
    av_space: 5,
    origin: "Copiapo",
    destination: "Santiago",
    date: Faker::Date.between(from: 10.days.ago, to: Date.today),
    time: Faker::Time.backward(days: 14, period: :all),
    user_id: user1.id
    )

# NICOLE HACE TURNO2
turn2 = Turn.create!(
    name: "VÑA-SANTIAGO",
    max_space: 5,
    av_space: 2,
    origin: "Viña del Mar",
    destination: "Santiago",
    date: Faker::Date.between(from: 10.days.ago, to: Date.today),
    time: Faker::Time.backward(days: 14, period: :all),
    user_id: user1.id
    )


# SOFIA HACE TURNO3
turn3 = Turn.create!(
    name: "ISABEL LA CATOLICA, LAS CONDES",
    max_space: 4,
    av_space: 4,
    origin: "dieciocho 173",
    destination: "Isabel la Catolica 5900",
    date: Faker::Date.between(from: 10.days.ago, to: Date.today),
    time: Faker::Time.backward(days: 14, period: :all),
    user_id: user2.id
    )

puts "Holiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"

# SOFIA SOLICITA TURNO 1 (TURNO CREADO POR NICOLE)
request1 = user2.requests.create!(
    turn_id: 1, 
    status: "Pendiente",
    description: "Voy con mi perrito, podrías aceptarme? te puedo retribuir :D"
)

# SOFIA SOLICITA TURNO 2 (TURNO CREADO POR NICOLE)
request2 = user2.requests.create!(
    turn_id: 2, 
    status: "Pendiente",
    description: "Voy a la universidad! espero me pueda aceptar en su turno"
)

# NICOLE SOLICITA TURNO 3 (TURNO CREADO POR SOFIA)
request3 = user1.requests.create!(
    turn_id: 3, 
    status: "Pendiente",
    description: "Holiiiiiiiiiiiii llevenme plissss"
)


#Reseña 1 de user1 Nicole a Turno 3 de Sofía
reseña1 = user1.ratings.create(user_id: 1, turn_id: 3, content: "Excelente atención :)", stars: 3)

#Reseña 2 de user2 Sofia a Turno 1 de Nicole 
reseña2 = user2.ratings.create(user_id: 2, turn_id: 1, content: "Buena música en el viaje", stars: 5)

