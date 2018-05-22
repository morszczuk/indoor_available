#!/usr/bin/env ruby
require 'nokogiri'

if ARGV.empty?
  puts "Nie podano argumentów"
  return
end

routes_set_1_path = ARGV[0]
indoor_navi_schema_path = '../schemas/indoorgmlnavi.xsd'

puts 'Sprawdzam poprawność syntaktyczną XML'
document = Nokogiri::XML(File.read(routes_set_1_path))

if document.errors.empty?
  puts "XML poprawny."
else
  puts document.errors
end

puts 'Sprawdzam poprawność XML względem schema'
schema = Nokogiri::XML::Schema(File.read(indoor_navi_schema_path))
errors = schema.validate(document)

if errors.empty?
  puts 'XML względem schemy poprawny'
else
  errors.each do |error|
    puts error.message
  end
end