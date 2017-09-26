require 'edools_sdk/edools_base'
require 'edools_sdk/school'
require 'edools_sdk/course'
require 'edools_sdk/product'
require 'edools_sdk/student'
require 'edools_sdk/invitation'
require 'yaml'

file_exists = File.file?('config/edools.yml')

if ENV['edools_token'].nil? && file_exists
  config = YAML.load_file('config/edools.yml')
  ENV['edools_token'] = config['token']
elsif ENV['edools_token'].nil? && !file_exists
  puts "WARNING: edools token not configurated!"
end