require 'rails_helper'

RSpec.describe Reports::PublishedCoursesReport do
  it "generates report with published courses and active students" do
    VCR.use_cassette("published_courses_report") do
      client = Teachable::Client.new(
        api_key: ENV.fetch('TEACHABLE_API_KEY')
      )

      report = described_class.new(client: client).call

      expect(report).to be_an(Array)
      expect(report).not_to be_empty

      report.each do |course|
        expect(course).to have_key(:name)
        expect(course).to have_key(:heading)
        expect(course).to have_key(:students)

        course[:students].each do |student|
          expect(student).to have_key(:name)
          expect(student).to have_key(:email)
        end
      end
    end
  end
end
