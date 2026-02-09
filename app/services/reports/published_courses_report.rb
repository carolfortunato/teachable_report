module Reports
  class PublishedCoursesReport
    def initialize(client:)
      @client = client
    end

    def call
      published_courses.map do |course|
      {
        name: course['name'],
        heading: course['heading'],
        students: active_students_for(course['id'])
      }
      end
    end

    private

    attr_reader :client

    def published_courses
      client.courses['courses'].select { |c| c['is_published'] }
    end

    
    def active_students_for(course_id)
      enrollments = client.enrollments(course_id:)['enrollments']

      enrollments
        .map { |e| student_data(e['user_id']) }
    end

    def student_data(user_id)
    user = client.user(user_id)

    {
      name: user['name'],
      email: user['email']
    }
    end
  end
end
