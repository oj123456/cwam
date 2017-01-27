class HelpersController < ApplicationController
  def index
    page_seo = SeoData.where(page: SeoData.pages[:features]).first
    @page_title = page_seo.title
    fill_seo(page_seo.title, page_seo.description, page_seo.keywords, page_seo.image.url)

    @advertisment = Advertisment.where(location: Advertisment.locations[:helpers_page]).order("RANDOM()").first
    @spices = Spice.all.order(:title)
    @kitchen_helpers = KitchenHelper.all.order(:title)
  end
end
