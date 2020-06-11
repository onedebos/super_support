

users = [

  {
    id: 30,
    name: 'Bimbo',
    email: 'bimbo@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    role: 'customer'

  },

  {
    id: 31,
    name: 'Dami',
    email: 'dami@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    role: 'customer'
  },

  {
    id: 32,
    name: 'Frank',
    email: 'frank@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    role: 'admin'
  },
  {
    id: 33,
    name: 'Shola',
    email: 'shola@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    role: 'agent'
  },
  {
    id: 34,
    name: 'Eddidiong',
    email: 'eddidiong@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    role: 'agent'
  }

]

tickets = [
{
    id: 35,
    user_id: 30,
    title: "I have a problem with the app",
    status: "opened",
    request: "I have had a problem with the app for 4 days now can you help?"    
},

{
    id: 36,
    user_id: 30,
    title: "I have a problem with the app",
    status: "opened",
    request: "I have had a problem with the app for 4 days now can you help?"    
},

{
    id: 37,
    user_id: 30,
    title: "I have a problem with the app",
    status: "in_progress",
    request: "I have had a problem with the app for 4 days now can you help?"    
},
{
    id: 38,
    user_id: 30,
    title: "I have a problem with the app",
    status: "completed",
    request: "I have had a problem with the app for 4 days now can you help?"    
},
{
    id: 39,
    user_id: 31,
    title: "I bought a brand new phone and it stopped working",
    status: "opened",
    request: "I have had a problem with the app for 4 days now can you help?"    
},
{
    id: 40,
    user_id: 31,
    title: "I bought a brand new phone and it stopped working",
    status: "completed",
    request: "I have had a problem with the app for 4 days now can you help?"    
},
{
    id: 41,
    user_id: 31,
    title: "I bought a brand new phone and it stopped working",
    status: "in_progress",
    request: "I have had a problem with the app for 4 days now can you help?"    
},
{
    id: 42,
    user_id: 31,
    title: "I bought a brand new phone and it stopped working",
    status: "completed",
    request: "I have had a problem with the app for 4 days now can you help?"    
}

]

comments = [
{
    id:43,
    comment: "Admin comment",
    user_name: "Eddidiong",
    ticket_id: 35,
    user_id: 34,
    user_role: "agent"
},
{
    id:44,
    comment: "customer comment",
    user_name: "Bimbo",
    ticket_id: 35,
    user_id: 30,
    user_role: "customer"
},
{
    id:45,
    comment: "agent comment",
    user_name: "Eddidiong",
    ticket_id: 35,
    user_id: 34,
    user_role: "agent"
},

{
    id:46,
    comment: "Agent comment",
    user_name: "Shola",
    ticket_id: 39,
    user_id: 33,
    user_role: "agent"
},
{
    id:47,
    comment: "customer comment",
    user_name: "Dami",
    ticket_id: 39,
    user_id: 31,
    user_role: "customer"
},
{
    id:48,
    comment: "customer comment",
    user_name: "Shola",
    ticket_id: 39,
    user_id: 33,
    user_role: "agent"
}


]


# users.each do |user|
#     User.create!(
#         id: user[:id],
#         name: user[:name],
#         email: user[:email],
#         password: user[:password],
#         password_confirmation: user[:password_confirmation],
#         role: user[:role]

#     )
# end


# tickets.each do |ticket|
#     Ticket.create!(
#         id: ticket[:id],
#         user_id: ticket[:user_id],
#         title: ticket[:title],
#         status: ticket[:status],
#         request: ticket[:request],
#     )
# end

comments.each do |comment|
    Comment.create!(
        id: comment[:id],
        user_id: comment[:user_id],
        comment: comment[:comment],
        user_name: comment[:user_name],
        ticket_id: comment[:ticket_id],
        user_role: comment[:user_role]
    )
end




