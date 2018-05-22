#!/usr/bin/env ruby
require 'nokogiri'
require 'happymapper'
require_relative '../lib/indoor_nav_gml_parser.rb'

if ARGV.empty?
  puts "Nie podano argumentów"
  return
end

routes_set_1_path = ARGV[0]
document = Nokogiri::XML(File.read(routes_set_1_path))

indoor_gml_parser = IndoorNavGMLParser.new(document)
parsed_routes = indoor_gml_parser.parse_routes

parsed_routes[0].build_route_graph

