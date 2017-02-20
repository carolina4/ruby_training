# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Note.count == 0
    Note.create(title: "Note 1", note: 'Nota 1 Nota 1 Nota 1 Nota 1 Nota 1 Nota 1 Nota 1 Nota 1')
    Note.create(title: "Note 2", note: 'Nota 2 Nota 2 Nota 2 Nota 2 Nota 2 Nota 2')
end