namespace :teachable do
  desc "Generate published courses report"
  task published_courses_report: :environment do
    puts "\n\nGenerating Published Courses Report..."

    client = Teachable::Client.new(api_key: ENV['TEACHABLE_API_KEY'])
    report = Reports::PublishedCoursesReport.new(client: client)

    puts "Fetching data from Teachable API. This may take a few moments.\n\n"

    pp report.call
  end
end
