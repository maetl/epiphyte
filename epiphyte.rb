require 'rubygems'
require 'treetop'
require 'rest_client'

module Epiphyte
  class Parser
    def self.validate(source)
      parser = RestClientParser.new
      result = parser.parse(source)
      
      unless result
        puts parser.failure_reason
        puts parser.failure_line
        puts parser.failure_column
      else
        puts "Parsing complete."
      end
    end
  end
end

Dir.glob('*.phyte').each do |f|
  Epiphyte::Parser.validate(File.open(f).read)
end