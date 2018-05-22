require_relative 'abstract_parser.rb'
require_relative 'point.rb'

class PointParser < AbstractParser
  def parse
    lat, lon, alt = get_position_coordinates
    Point.new parse_gml_id, lat, lon, alt
  end

  private

  def get_position_coordinates
    content = @xml.xpath('.//gml:pos').first.content
    content.split(' ')
  end
end
