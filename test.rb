require 'faker'
# create users in DB
(1..20).each do |id|
    User.create!(
        id: id,
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "password",
        password_confirmation: "password",
        role: %w[customer admin agent].sample
    )
end

# create tickets in DB
(1..10).each do |id|
    Ticket.create!(
        id: id,
        user_id: rand(1..20),
        title: Faker::University.name,
        status: %w[opened closed completed],
        request: Faker::Lorem.paragraphs(number: 1)
    )
end

# create comments in DB. Comments belong to tickets
(1..10).each do |id|
    Comment.create!(
        id: id,
        user_id: rand(1..20),
        comment: Faker::Lorem.sentence(word_count: 3),
        user_name: User.find(rand(1..20)),
        ticket_id: rand(1..10),
        user_role: %w[customer admin agent].sample
    )
end