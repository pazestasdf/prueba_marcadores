# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Variety.destroy_all
['Video','Article','Paper','Image','Audio'].each do |var|
  Variety.create(name: var)
end

Category.destroy_all
cat_animals = Category.create(name: 'Animals')
    Category.create(name: 'Mammals', category_id: cat_animals.id)
    Category.create(name: 'Birds', category_id: cat_animals.id)
    Category.create(name: 'Amphibians', category_id: cat_animals.id)

cat_movies = Category.create(name: 'Movies')
    Category.create(name: 'Documental', category_id: cat_movies.id)
    Category.create(name: 'Drama', category_id: cat_movies.id)
    cat_movies_horror = Category.create(name: 'Horror', category_id: cat_movies.id)
        Category.create(name: 'Slasher', category_id: cat_movies_horror.id)
        Category.create(name: 'Vampires', category_id: cat_movies_horror.id)

Bookmark.destroy_all
20.times do
    Bookmark.create(
        url: Faker::Internet.url,
        name: Faker::Internet.url,
        category_id: rand(Category.first.id..Category.last.id),
        variety_id: rand(Variety.first.id..Variety.last.id),
    )
end