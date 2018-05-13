#!/usr/bin/env ruby
require 'nokogiri'

indoornaviURI = 'http://www.opengis.net/indoorgml/1.0/navigation'

routes_set_1_path = '../test_data/routes_set_1.xml'
document = Nokogiri::XML(File.read(routes_set_1_path))

puts document.class

routeNodes = document.xpath("//nav:Route/nav:routeNodes", nav: indoornaviURI)
puts routeNodes
puts routeNodes.class

nodes = routeNodes.xpath("//nav:RouteNode", nav: indoornaviURI)
puts nodes

nodes.each do |routeNode|
  puts routeNode['gml:id']
  puts routeNode.class
  puts routeNode.xpath(".//nav:geometry/gml:Point/gml:pos").first
  value = routeNode.xpath(".//nav:geometry/gml:Point/gml:pos").first.content
  puts value
  coords = value.split(' ')
  puts coords.class
  puts coords.count
  coords.map! { |elem| elem.to_f }
  puts coords
  puts coords.first.class
end