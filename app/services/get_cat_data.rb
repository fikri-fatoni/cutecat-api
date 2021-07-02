require 'net/http'
require 'uri'

class GetCatData
  def initialize
    @result = {}
  end

  def fetch
    response           = send_request
    @result[:status]   = 'false'
    if response.is_a?(Net::HTTPOK)
      @result[:status]   = 'true'
      @result[:response] = JSON.parse(response.body)
      @result
    else
      @result = nil
    end
  end

  private

  def set_header
    {
      'Content-type' => 'application/json',
      'Accept' => 'application/json'
    }
  end

  def send_request
    cataas_url   = 'https://cataas.com/api/cats?tags=cute'
    uri          = URI.parse(cataas_url.to_s)
    http         = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.get(uri, set_header)
  end
end
