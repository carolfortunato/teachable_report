class HomeController < ActionController::Base
  def index
  end

  def published_courses
    client = Teachable::Client.new(api_key: ENV['TEACHABLE_API_KEY'])
    report = Reports::PublishedCoursesReport.new(client: client)

    render json: report.call
  end
end
