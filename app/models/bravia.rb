# frozen_string_literal: true

# BRAVIA
class Bravia
  APP_URLS = {
    primevideo: 'com.sony.dtv.com.amazon.amazonvideo.livingroom.com.amazon.ignition.IgnitionActivity',
    netflix: 'com.sony.dtv.com.netflix.ninja.com.netflix.ninja.MainActivity'
  }.freeze

  def initialize
    @faraday = Faraday.new(
      url: 'http://192.168.0.12/sony',
      headers: { 'X-Auth-PSK' => Rails.application.credentials.bravia[:preshared_key] }
    )
  end

  def set_power_status(status)
    params = { status: status }
    execute(service: 'system', method: 'setPowerStatus', id: 55, params: params)
  end

  def set_active_app(uri)
    params = { uri: uri }
    execute(service: 'appControl', method: 'setActiveApp', id: 601, params: params)
  end

  def set_hdmi_input(port)
    params = { uri: "extInput:hdmi?port=#{port}" }
    execute(service: 'avContent', method: 'setPlayContent', id: 101, params: params)
  end

  private

  def execute(service:, method:, id:, params: {})
    @faraday.post(service) do |req|
      req.body = {
        method: method,
        id: id,
        params: [params],
        version: '1.0'
      }.to_json
    end
  end
end
