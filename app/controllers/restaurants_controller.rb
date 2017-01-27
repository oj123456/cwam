class RestaurantsController < ApplicationController
  def index
    page_seo = SeoData.where(page: SeoData.pages[:restaurants]).first
    @page_title = page_seo.title
    fill_seo(page_seo.title, page_seo.description, page_seo.keywords, page_seo.image.url)

    @advertisment = Advertisment.where(location: Advertisment.locations[:places_page]).order("RANDOM()").first
  end
end
