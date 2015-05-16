require 'net/http'

class FetchRouteService
  def initialize(start_position, end_position)
    @end = end_position
    @start = start_position
  end

  def fetch_path
    fetch[:route][:path][:coordinates]

  private

  def fetch
    uri = URI.parse("http://sdi.provinz.bz.it/routingservice/rest/routing/escursionista?lang=de")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.path)
    request.add_field("Content-Type", "application/json")
    request.add_field("Accept", "application/json")

    data = {
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
    }

    response = http.request(request, data.to_json)
    json = JSON.parse(response.body)
    json.deep_symbolize_keys
  end

end
=begin
l1 = Location.first
l2 = Location.last
service = FetchRouteService.new(l1, l2)
service.fetch
=end
