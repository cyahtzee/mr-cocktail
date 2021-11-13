# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'


puts("Destroying cocktails..")
puts("Destroying ingridients..")

Cocktail.destroy_all
Ingredient.destroy_all

puts("Creating ingredients...")
url_ingridients = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(URI.open(url_ingridients).read)['drinks']
ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end
puts("ingredients ready...")

puts("Creating Cocktails...")

10.times do
  url_cocktail = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
  cocktail = JSON.parse(URI.open(url_cocktail).read)['drinks'][0]
  Cocktail.create!(
    name: cocktail['strDrink'],
    image_url: cocktail['strDrinkThumb']
  )
end
