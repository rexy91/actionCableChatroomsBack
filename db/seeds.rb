# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create three rooms:
rex = User.create!({username:'rexye', password:'woaicheng1'})
jo = User.create!({username:'jojo', password:'jojojo'})

cats = Room.create(name: 'Cat Lovers', description:'This chatroom is for anyone who loves cats...')
dogs = Room.create(name: 'Dog Lovers', description:'This chatroom is for anyone who loves dogs.')
programmers = Room.create(name: 'Programmers', description:'This chatroom is for programmers.')

Message.create(user:rex, room: programmers, content:'I am Rex, a JavaScript lover.')
Message.create(user:jo, room:programmers, content:'I am jo, a Ruby lover.')

