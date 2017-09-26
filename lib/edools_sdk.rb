require 'edools_sdk/edools_base'
require 'edools_sdk/school'
require 'edools_sdk/course'
require 'edools_sdk/product'
require 'edools_sdk/student'
require 'edools_sdk/invitation'
require 'yaml'

if ENV['edools_token'].nil?
  config = YAML.load_file('config/edools.yml')
  ENV['edools_token'] = config['token']
end