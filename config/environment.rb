# Load the Rails application.
require File.expand_path('../application', __FILE__)
PRIVATE_DATA = YAML.load_file("#{Rails.root}/config/private.yml")[Rails.env]
VERSION = '1.0.0'

# Initialize the Rails application.
Rails.application.initialize!
