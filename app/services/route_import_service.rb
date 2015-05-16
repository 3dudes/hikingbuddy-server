class RouteImportService
  def initialize(file_name)
    @xml_path = Rails.root.join("routes", file_name)
  end

  def path
    file = File.open(@xml_path)
    document = Nokogiri::XML(file)

    document.css("trkpt").map do |node|
      {
        latitude: node.css("lat"),
        longitude: node.css("lon")
      }
    end
  end
end
=begin
service = RouteImportService.new("route.gpx")
service.path
=end
