require 'vcr'

VCR.configure do |config|

  config.default_cassette_options = {
    record: :once
  }
end
