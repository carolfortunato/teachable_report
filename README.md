# Teachable Report

This project generates reports with published courses and active students by consuming the Teachable API.
It includes automated tests using RSpec and WebMock.

## How to Run

### Prerequisites
- Ruby 3.x
- Bundler
- Teachable API Key

### Installation
Install dependencies

```bash
bundle install
```

### Configuration

This project requires a Teachable API key to run.

Create a `.env` file in the project root

```
TEACHABLE_API_KEY=your_api_key_here
```

**Note:** Do not commit `.env` (add to `.gitignore`).

No database setup is required, as the application does not persist data and acts only as an API consumer.

### CLI Execution
This project includes a rake task to generate the Published Courses Report from the command line.

```bash
bundle exec rake reports:published_courses
```

Make sure your `TEACHABLE_API_KEY` is set before running the task.
If using `.env`, nothing extra is required.
If not using `.env`, you can run:

```bash
TEACHABLE_API_KEY=your_api_key_here bundle exec rake reports:published_courses
```

What the Task Does

When executed, the rake task:
- Instantiates `Reports::PublishedCoursesReport`
- Calls the Teachable API
- Fetches published courses
- Retrieves active students for each course
- Outputs the formatted report to the console

### Running the Web Interface
This project includes a very simple web interface built with Rails to display the published courses report.

*Starting the Server*

From the project root, run:

```bash
rails server
```
*Accessing the Report*

Open your browser and navigate to: `http://localhost:3000`

The home page will:

- Display a loading message while data is being fetched from the Teachable Public API.

- Retrieve all published courses.

- Fetch active enrollments and related student information.

- ender the report dynamically once the data is available.

## How to Run Tests

```bash
bundle exec rspec
```

To run a specific test:

```bash
bundle exec rspec spec/reports/published_courses_report_spec.rb
```

With detailed output:

```bash
bundle exec rspec --format documentation
```

**Note:** Tests use VCR to record/replay HTTP responses, eliminating dependency on the live API during execution.

## Architectural Decisions

### 1. **Report Service (Reports::PublishedCoursesReport)**
- Encapsulates report generation logic
- Separates business concern from API client

### 2. **HTTP Client (Teachable::Client)**
- Wrapper around Faraday
- Centralizes configuration and API key authentication
- Facilitates maintenance and testing

### 3. **VCR + WebMock for Testing**
- Records real HTTP responses as cassettes
- Tests run fast, offline, independent of live API
- Prevents API key exposure in CI/CD

### 4. **Folder Structure**
```
app/
  services/
    reports/         # report generation logic
    teachable/       # API client
spec/
  reports/           # report tests
  vcr_cassettes/     # HTTP recordings
```

## Trade-offs

| Decision | Pro | Con |
|----------|-----|-----|
| **VCR for tests** | Fast, offline, secure | Cassettes become stale if API changes |
| **Separate service** | Testable logic, reusable | Extra abstraction layer |
| **Environment variables** | Secure, flexible | Requires initial setup |
| **Faraday** | Simple, supports multiple adapters | Additional dependency |

## AI Usage (GitHub Copilot)

This project was developed with assistance from **GitHub Copilot** (Claude Haiku 4.5):

- **Initial scaffolding:** Folder structure and file setup
- **Spec generation:** RSpec test templates
- **VCR/WebMock configuration:** Isolated test setup
- **Debugging:** Error diagnosis (NameError, WebMock)
- **Documentation:** This README

**Benefit:** Accelerated initial setup and quick resolution of common errors.

---

Built with ❤️ and AI