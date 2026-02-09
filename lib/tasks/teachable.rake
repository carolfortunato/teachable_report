namespace :teachable do
  desc "Generate published courses report"
  task published_courses_report: :environment do
    client = Teachable::Client.new(api_key: ENV['TEACHABLE_API_KEY'])
    report = Reports::PublishedCoursesReport.new(client: client)

    pp report.call
  end
end
