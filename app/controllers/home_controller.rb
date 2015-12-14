class HomeController < ApplicationController
  require 'open-uri'
  require 'json'

  def index
    @weathers = Weather.all
    @hash = Gmaps4rails.build_markers(@weathers) do |weather, marker|
      marker.lat weather.lat
      marker.lng weather.long
    end

    ip = request.remote_ip
    #url = 'ipinfo.io/'+ip
    #str = Curl.get(url)
    @http = GeoIp.geolocation(ip)

    if @http[:ip] == '127.0.0.1'
      lat = '23.43'
      lng = '90.26'
      url = "http://weathernews.jp/v/SOIASIA/weather.cgi?latlon=#{lat}/#{lng}"
    else
      lat = @http[:latitude]
      lng = @http[:longitude]
      url = "http://weathernews.jp/v/SOIASIA/weather.cgi?latlon=#{lat}/#{lng}"
    end

    @weather_update = JSON.parse(open(url).read)

  end
end
