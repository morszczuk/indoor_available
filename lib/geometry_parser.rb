require_relative 'abstract_parser.rb'
require_relative 'line_string_parser.rb'

class GeometryParser < AbstractParser
  def parse
    line_xml = get_single_elem('.//gml:LineString')
    parse_line(line_xml) unless line_xml.nil?
  end

  private

  def parse_line(line_xml)
    LineStringParser.new(line_xml)
                    .parse
  end
end