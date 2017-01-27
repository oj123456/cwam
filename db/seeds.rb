# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.all.count == 0
  User.create(first_name: 'CWAM', last_name: 'Admin', email: 'admin@cookingwithamanicure.com', password: 'hello123', password_confirmation: 'hello123', admin: true)
end

if SeoData.all.count == 0
  SeoData.create(page: SeoData.pages[:home], title: "Home", description: "home", keywords: "cooking with a manicure", image: File.open('/var/www/public/images/missing.png'))
  SeoData.create(page: SeoData.pages[:recipes], title: "Recipes", description: "Recipes", keywords: "cooking with a manicure", image: File.open('/var/www/public/images/missing.png'))
  SeoData.create(page: SeoData.pages[:news], title: "News", description: "News", keywords: "cooking with a manicure", image: File.open('/var/www/public/images/missing.png'))
  SeoData.create(page: SeoData.pages[:features], title: "Features", description: "Features", keywords: "cooking with a manicure", image: File.open('/var/www/public/images/missing.png'))
  SeoData.create(page: SeoData.pages[:restaurants], title: "Restaurants", description: "Restaurants", keywords: "cooking with a manicure", image: File.open('/var/www/public/images/missing.png'))
  SeoData.create(page: SeoData.pages[:about], title: "About", description: "About", keywords: "cooking with a manicure", image: File.open('/var/www/public/images/missing.png'))
end

