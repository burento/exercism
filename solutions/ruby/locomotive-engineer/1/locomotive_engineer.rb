class LocomotiveEngineer
  def self.generate_list_of_wagons(*ids)
    ids
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    y, z, loco, *train = each_wagons_id
    wagon_list = loco, *missing_wagons, *train, y, z
    # first = each_wagons_id.index(1)
    # wagon_list = each_wagons_id[..first] + missing_wagons + each_wagons_id[first+1..]
    # wagon_list = wagon_list[2..] + wagon_list[..1]
    wagon_list
  end

  def self.add_missing_stops(routing, **stops)
    routing[:stops] = stops.map { |_,v| v }
    routing
  end

  def self.extend_route_information(route, more_route_information)
    {**route, **more_route_information}
  end
end
