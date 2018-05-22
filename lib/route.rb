require 'ruby-graphviz'

class Route
  attr_accessor :gml_id, :route_nodes, :start_route_node, :end_route_node, :path
  def initialize(gml_id, route_nodes, start_route_node, end_route_node, path)
    @gml_id = gml_id
    @route_nodes = route_nodes
    @start_route_node = start_route_node
    @end_route_node = end_route_node
    @path = path
  end

  def build_route_graph
    g = GraphViz.new(:G, type: :digraph)
    graph_nodes = @route_nodes.map do |node|
      g.add_nodes(node.gml_id)
    end

    @path.route_segments.each do |segment|
      g.add_edges graph_nodes[@route_nodes.index(@route_nodes.find { |r_n| r_n.gml_id == segment.connected_nodes[0].gml_id})],
                  graph_nodes[@route_nodes.index(@route_nodes.find { |r_n| r_n.gml_id == segment.connected_nodes[1].gml_id})],
                  weight: segment.weight
    end

    # g.add_edges(graph_nodes[0], graph_nodes[1])
    g.output png: 'hello_world.png'

  end

  def to_s
    "<Route gml_id: [#{@gml_id}]\n"\
      "\troute_nodes: \n\t\t#{@route_nodes.map{|r_n| r_n.to_s }}]\n"\
      "\tstart_route_node: \n\t\t#{@start_route_node.to_s}]\n"\
      "\tend_route_node: \n\t\t#{@end_route_node.to_s}"\
      "\tpath: \n\t\t#{@path.to_s}]>"
  end
end