require_relative 'route_parser.rb'

class IndoorNavGMLParser < AbstractParser
  def parse_routes
    @xml.xpath('//nav:Route').map do |route_xml|
      RouteParser.new(route_xml).parse
    end
  end
end