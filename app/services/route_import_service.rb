class RouteImportService
  def initialize(file_name)
    @xml_path = Rails.root.join("routes", file_name)
  end

  def path
    file = File.open(@xml_path)
    document = Nokogiri::XML(file)

    document.css("trkpt").map do |node|
      {
        latitude: node.attribute("lat").value.to_f,
        longitude: node.attribute("lon").value.to_f,
        altitude: node.at_css("ele").content.to_f
      }
    end
  end
end
=begin
service = RouteImportService.new("route.gpx")
service.path
=end
