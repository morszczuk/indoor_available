require_relative 'route_node_parser.rb'
require_relative 'path_parser.rb'
require_relative 'route.rb'

class RouteParser < AbstractParser
  def parse
    @route_nodes = parse_route_nodes @xml.xpath('.//nav:routeNodes/nav:nodeMember/nav:RouteNode')
    @route = create_route
    update_references
    puts @route
    @route
  end

  private

  def parse_route_nodes(route_nodes_xml)
    route_nodes_xml.map do |route_node_xml| 
      RouteNodeParser.new(route_node_xml).parse
    end
  end

  def create_route
    Route.new parse_gml_id,
              @route_nodes,
              find_node(parse_start_node_gml_id),
              find_node(parse_end_node_gml_id),
              parse_path
  end

  def parse_start_node_gml_id
    parse_node_gml_id('nav:startRouteNode')
  end

  def parse_end_node_gml_id
    parse_node_gml_id('nav:endRouteNode')
  end

  def parse_node_gml_id(element_name)
    start_route_node_xml = @xml.xpath(".//#{element_name}").first
    raw_node_gml_id = parse_attr 'xlink:href', start_route_node_xml
    /\#(.*)/.match(raw_node_gml_id)[1]
  end

  def find_node(node_gml_id)
    return nil if node_gml_id.nil?
    @route_nodes.find { |node| node.gml_id == node_gml_id }
  end

  def parse_path
    PathParser.new(@xml.xpath('.//nav:path').first).parse
  end

  def update_references
    @route.path.route_members.each do |r_m|
      r_m.route_segments.each do |r_s|
        if r_s.connected_nodes[0].class == String
          r_s.connected_nodes.map! do |c_n|
            @route.route_nodes.find { |r_n| r_n.gml_id == c_n }
          end
        end
      end
    end
  end
end