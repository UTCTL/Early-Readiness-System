# Load the rails application
require File.expand_path('../application', __FILE__)

ENV['RAILS_ENV'] ||= 'development'

# Initialize the rails application
EarlyReadinessSystem::Application.initialize!
