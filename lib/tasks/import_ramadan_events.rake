require 'rest-client'
namespace :import do
  desc "Import ramadan events"
  task :ramadan_events => :environment do

    url = 'http://www.roundmenu.com/api/v2_eventsbycategory?cat_id=17&lang=en&v=7&city_id=1'
    headers = {apikey: '56JQNLW5P3XSCOG7ZX0FY7YNC90IJM2K'}

    data = JSON.parse RestClient.get(url, headers=headers) #we get if first time to get the max_page
    max_page = data["response"]["pagecount"]

    (1..max_page).each do |page_nb|
      data = JSON.parse RestClient.get("#{url}&page=#{page_nb.to_s}", headers=headers)
      data["events"].each do |event_datum|
        Event.create(
          title: event_datum["rst_short_name"],
          description: event_datum["description"],
          tag_line: event_datum["event_name"],
          start_date: event_datum["start_date"],
          end_date: event_datum["end_date"],
          location: event_datum["rst_name"],
          phone_number: event_datum["rst_land_phone"],
          image: URI.parse(event_datum["main_image_url"]),
          image_2: URI.parse(event_datum["main_image_url"]),
        )
      end
    end
  end
end
