class HomeController < ApplicationController

  def index
    page_seo = SeoData.where(page: SeoData.pages[:home]).first
    @page_title = page_seo.title
    fill_seo(page_seo.title, page_seo.description, page_seo.keywords, page_seo.image.url)

    @homepage_images = InteractiveImage.where(location: :homepage)
    @recipe_of_the_week = Recipe.where(recipe_of_the_week: true).first
    @advertisment = Advertisment.where(location: Advertisment.locations[:homepage]).order("RANDOM()").first
  end

end
