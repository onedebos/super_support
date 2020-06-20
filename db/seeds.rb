require 'faker'

User.destroy_all
# generate 20 users
(1..20).each do |id|
    User.create!(
        id: id, # each user is assigned an id from 1-20
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "password", # issue each user the same password
        password_confirmation: "password",
        role: %w[customer admin agent].sample # a user can have only one of these roles
    )
end

# create 10 tickets in DB
(1..10).each do |id|
    Ticket.create!(
        id: id,
        user_id: rand(1..20), # we have userIds between 1 and 20. Assign a ticket to a user randomly
        title: Faker::University.name, 
        status: %w[opened in_progress completed].sample,
        request: Faker::Lorem.paragraph # generate a fake paragraph
    )
end

# create comments in DB. Comments belong to tickets
(1..10).each do |id|
    Comment.create!(
        id: id,
        user_id: rand(1..20),
        comment: Faker::Lorem.sentence(word_count: 3),
        user_name: User.find(rand(1..20)).name,
        ticket_id: rand(1..10),
        user_role: %w[customer admin agent].sample
    )
end