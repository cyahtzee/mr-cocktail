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
    image_url: cocktail['strDrinkThumb'],
    category: cocktail['strAlcoholic'],
    instruction: cocktail['strInstructions']
  )
end
