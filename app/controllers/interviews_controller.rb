class InterviewsController < ApplicationController
  def show
    if params[:slug]
      @interview = Interview.where(slug: params[:slug]).first
    end

    if !@interview
      redirect_to root_path
    else
      @page_title = @interview.title
      @other_interviews = Interview.limit(2).where("id <> ? ", @interview.id).order("RANDOM()")
      @advertisment = Advertisment.where(location: Advertisment.locations[:interview_inner_page]).order("RANDOM()").first
      fill_seo(@interview.title,@interview.description, "", @interview.image.url)
    end
  end
end
