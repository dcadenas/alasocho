require 'geoip'

class GeoLocator
  def self.data(ip)
    source.city(ip)
  end

  def self.source
    @source ||= GeoIP.new(file)
  end

  def self.file
    Rails.root.join("data", "GeoLiteCity.dat")
  end

  def self.city_from_ip(ip)
    info = data(ip)
    return "" if info.blank?
    [:city_name, :country_name].map { |m| info.send(m) }.join(", ")
  end
end