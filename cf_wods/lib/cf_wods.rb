require_relative "./cf_wods/version"
require_relative "./cf_wods/cli"
require_relative "./cf_wods/months"
require_relative "./cf_wods/scraper"
require_relative "./cf_wods/workouts"
require 'nokogiri'
require 'open-uri'
require 'pry'

module CfWods
  class Error < StandardError; end
  # Your code goes here...
end
