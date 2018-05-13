#!/usr/bin/env ruby
require 'nokogiri'

def validate(document_path, schema_path, root_element)
  schema = Nokogiri::XML::Schema(File.read(schema_path))
  document = Nokogiri::XML(File.read(document_path))
  schema.validate(document.xpath("//#{root_element}").to_s)
end

routes_set_1_path = '../test_data/routes_set_1.xml'
indoor_navi_schema_path = '../schemas/indoorgmlnavi.xsd'

puts 'Sprawdzam poprawność XML'
document = Nokogiri::XML(File.read(routes_set_1_path))

if document.errors.empty?
  puts "XML poprawny."
else
  puts document.errors
end

puts 'Sprawdzam poprawność XML względem schema'
schema = Nokogiri::XML::Schema(File.read(indoor_navi_schema_path))
puts "Schema wczytana"
puts schema.class
puts "To była klasa, a teraz sprawdzamy"
schema.validate(document).each do |error|
  puts error.message
end


# validate('../test_data/routes_set_1.xml', '../schemas/indoorgmlnavi.xsd', 'RoutesSet').each do |error|
  # puts error.message
# end