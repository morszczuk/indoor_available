require_relative 'abstract_parser.rb'
require_relative 'line_string.rb'

class LineStringParser < AbstractParser
  def parse
    LineString.new parse_gml_id,
                   parse_positions
  end

  private

  def parse_positions
    get_elems('.//gml:pos').map do |pos|
      lat, lon, alt = get_text_content('.', pos).split(' ')
      {
        lat: lat.to_f,
        lon: lon.to_f,
        alt: alt.to_f
      }
    end
  end
end