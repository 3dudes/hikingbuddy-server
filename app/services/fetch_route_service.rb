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
    #request["Accept"] = "application/json"
    request["Content-Type"] = "application/json"

    request.body = {
      route: {
        start_point: {
          coordinate: [
            @start[:latitude],
            @start[:longitude]
          ]
        },
        end_point: {
          coordinate: [
            @end[:latitude],
            @end[:longitude]
          ]
        },
        int_point: {
          coordinate: []
        }
      }
    }.to_json


    response = http.request(request)
    puts response.body
  end
end
=begin
l1 = Location.first
l2 = Location.last
service = FetchRouteService.new(l1, l2)
service.fetch
=end
