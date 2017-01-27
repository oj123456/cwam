class NewsController < ApplicationController
  def index
    page_seo = SeoData.where(page: SeoData.pages[:news]).first
    @page_title = page_seo.title
    fill_seo(page_seo.title, page_seo.description, page_seo.keywords, page_seo.image.url)

    @advertisment = Advertisment.where(location: Advertisment.locations[:events_page]).order("RANDOM()").first
    @events = Event.all.order(created_at: :desc)
    @competitions = Competition.all.order(created_at: :desc)
    @interviews = Interview.all.order(created_at: :desc)
    @press_releases = PressRelease.all.order(created_at: :desc)

  end
end
