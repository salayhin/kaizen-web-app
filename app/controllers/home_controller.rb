class HomeController < ApplicationController
  def index
    @weathers = Weather.all
    @hash = Gmaps4rails.build_markers(@weathers) do |weather, marker|
      marker.lat weather.lat
      marker.lng weather.long
    end
  end
end
