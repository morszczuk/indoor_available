class Path
  attr_accessor :gml_id, :route_members
  
  def initialize(gml_id, route_members)
    @gml_id = gml_id
    @route_members = route_members
  end

  def route_segments
    route_members.map do |route_member|
      route_member.route_segments[0]
    end
  end
  
  def to_s
    "<Path gml_id: [#{@gml_id}]\n"\
      "\troute_members: \n\t\t#{@route_members.map{|r_m| r_m.to_s }}]\n"\
      ">"
  end
end