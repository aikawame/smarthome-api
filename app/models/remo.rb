# frozen_string_literal: true

# Nature Remo
class Remo
  BASE_URL = 'https://api.nature.global/1'

  SIGNALS = {
    amp: {
      power: 'fd5a3b02-7f82-4270-a4fc-b20ef0060235',
      input_usb: '9f4b23aa-90d0-45ed-ba5a-7ad4f47d985d',
      input_opt: '0692ce88-a77b-44c9-879c-db609f56ff0e'
    }
  }.freeze

  def initialize
    @faraday = Faraday.new(
      url: 'https://api.nature.global/1',
      headers: { 'Authorization' => "Bearer #{Rails.application.credentials.remo[:oauth_token]}" }
    )
  end

  def send_signal(signal_id)
    @faraday.post("signals/#{signal_id}/send")
  end
end
