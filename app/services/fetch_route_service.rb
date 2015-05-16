require 'net/http'

class FetchRouteService
  def initialize(start_position, end_position)
    @end = end_position
    @start = start_position
  end

  def fetch
    uri = URI.parse("http://sdi.provinz.bz.it/routingservice/rest/routing/escursionista?lang=de")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.path)
    request.add_field("Content-Type", "application/json")
    request.add_field("Accept", "application/json")

    data = {
      route: {
        start_point: {
          coordinate: [1250612.0051522,5879279.857354]# [
            #@start[:latitude],
            #@start[:longitude]
          #]
        },
        end_point: {
          coordinate: [1282715.557032,5891051.1597099] # [
            # @end[:latitude],
            #@end[:longitude]
        #  ]
        },
        int_point: {
          coordinate: []
        }
      }
    }

    response = http.request(request, data.to_json)
    puts response.body
  end
end
=begin
l1 = Location.first
l2 = Location.last
service = FetchRouteService.new(l1, l2)
service.fetch
=end
