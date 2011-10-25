require 'rubygems'
require 'treetop'
require 'rest_client'

source = File.open('time.phyte').read

parser = RestClientParser.new

result = parser.parse(source)

unless result
  puts parser.failure_reason
  puts parser.failure_line
  puts parser.failure_column
else
  puts "Parsing complete."
end