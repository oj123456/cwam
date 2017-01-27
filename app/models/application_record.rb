class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def generate_slug

    passed = false
    count = 0
    new_slug = self.title.strip.downcase

    #blow away apostrophes
    new_slug.gsub! /['`]/,""

    # @ --> at, and & --> and
    new_slug.gsub! /\s*@\s*/, " at "
    new_slug.gsub! /\s*&\s*/, " and "

    #replace all non alphanumeric, underscore or periods with underscore
    new_slug.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '_'

    #convert double underscores to single
    new_slug.gsub! /_+/,"_"

    #strip off leading/trailing underscore
    new_slug.gsub! /\A[_\.]+|[_\.]+\z/,""

    temp_slug = ''
    while !passed
      #we check if there's an exisitng slug with the same name
      temp_slug = "#{new_slug}#{count > 0 ? "_#{count}" : ""}"
      if self.class.where(slug: temp_slug).count == 0
        passed = true
      end
      count += 1
    end
    self.slug = temp_slug

  end
end
