require_relative 'route_node_parser.rb'

class RouteParser
  def initialize(route_xml)
    @route_xml = route_xml
  end

  def parse
    route_nodes = parse_route_nodes @route_xml.xpath('.//nav:routeNodes/nav:nodeMember/nav:RouteNode')
    puts route_nodes
    # Route.new create_params
    'parsed motherfucker'
  end

  private

  def parse_route_nodes(route_nodes_xml)
    # puts route_nodes.class
    # puts route_nodes
    # puts route_nodes.count
    route_nodes_xml.map do |route_node_xml| 
      RouteNodeParser.new(route_node_xml).parse
    end
  end

  def create_params
    
  end
end