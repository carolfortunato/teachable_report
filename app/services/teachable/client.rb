module Teachable
  class Client
    BASE_URL = 'https://developers.teachable.com/v1'.freeze

    def initialize(api_key:)
      @api_key = api_key
    end

    def courses()
      get('courses')
    end

    def enrollments(course_id:)
      get("courses/#{course_id}/enrollments")
    end

    def user(user_id)
      get("users/#{user_id}")
    end

    private

    attr_reader :api_key

    def connection
      @connection ||= Faraday.new(url: BASE_URL) do |faraday|
        faraday.request :json

        faraday.headers['apiKey'] = "#{api_key}"
        faraday.headers['accept'] = 'application/json'

        faraday.adapter Faraday.default_adapter
      end
    end

    def get(path, params = {})
      response = connection.get(path, params)

      JSON.parse(response.body)
    rescue Faraday::Error => e
      raise e
    end
  end
end
