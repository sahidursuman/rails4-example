# Load the Rails application.
require File.expand_path('../application', __FILE__)

PRIVATE_DATA = Rails.application.config_for(:private)
VERSION = '1.0.0'

# Initialize the Rails application.
Rails.application.initialize!
