module ApplicationHelper
  def get_detail_info(lat, lng)
    if lat.present? && lng.present?
      url = "http://weathernews.jp/v/SOIASIA/weather.cgi?latlon=#{lat}/#{lng}"
      weather = JSON.parse(open(url).read)
      weather.first
    end
  end
end
