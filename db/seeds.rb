require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "cleaning DB"
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

puts "creating lists"
file = URI.open('https://thumbs.dreamstime.com/b/fiction-word-handwritten-white-background-178119139.jpg')
fiction = List.new(name: 'Fiction')
fiction.photo.attach(io: file, filename: 'fiction.png', content_type: 'image/png')
fiction.save

file = URI.open('https://st2.depositphotos.com/1498528/9192/v/950/depositphotos_91922214-stock-illustration-action-word-icon.jpg')
action = List.new(name: 'Action')
action.photo.attach(io: file, filename: 'action.png', content_type: 'image/png')
action.save

file = URI.open('https://thumbs.dreamstime.com/b/masques-de-th%C3%A9%C3%A2tre-drame-et-com%C3%A9die-illustration-du-trag%C3%A9die-masque-comique-blanche-noire-tattoo-157485671.jpg')
drame = List.new(name: 'Drame')
drame.photo.attach(io: file, filename: 'drame.png', content_type: 'image/png')
drame.save


puts "creating movies"
wonder = Movie.create(title: 'Wonder Woman 1984', overview: 'Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s', poster_url: 'https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg', rating: 6.9)
shawshank = Movie.create(title: 'The Shawshank Redemption', overview: 'Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison', poster_url: 'https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg', rating: 8.7)
titanic = Movie.create(title: 'Titanic', overview: '101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.', poster_url: 'https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg', rating: 7.9)
ocean = Movie.create(title: "Ocean's Eight", overview: 'Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.', poster_url: 'https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg', rating: 7.0)


puts "creating bookmark"
book1 = Bookmark.create(comment: "ceci est un bookmark", list: fiction, movie: wonder)
book2 = Bookmark.create(comment: "ceci est un bookmark", list: action, movie: shawshank)
book3 = Bookmark.create(comment: "ceci est un bookmark", list: drame, movie: titanic)
book4 = Bookmark.create(comment: "ceci est un bookmark", list: action, movie: ocean)
