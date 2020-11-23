# frozen_string_literal: true

# スキルコントローラー
class SkillsController < ApplicationController
  def pc
    request = AlexaRubykit.build_request(params)
    @response = AlexaRubykit::Response.new

    case request.type
    when 'LAUNCH_REQUEST'
      poweron
    when 'INTENT_REQUEST'
      case request.slots[:inputName][:value]
      when 'windows'
        input_windows
      when 'primevideo'
        input_primevideo
      when 'netflix'
        input_netflix
      else
        raise StandardError
      end
    else
      raise StandardError
    end

    render json: @response.build_response
  end

  private

  def poweron
    WakeOnLan.send(Rails.application.credentials.windows[:mac_address])
    Bravia.new.set_power_status(true)
    Remo.new.send_signal(Remo::SIGNALS[:amp][:power])

    @response.add_speech('オンにしました')
  end

  def input_windows
    WakeOnLan.send(Rails.application.credentials.windows[:mac_address])
    bravia = Bravia.new
    bravia.set_hdmi_input(4)
    Remo.new.send_signal(Remo::SIGNALS[:amp][:input_usb])

    @response.add_speech('Windowsを開きました')
  end

  def input_primevideo
    bravia = Bravia.new
    bravia.set_active_app(Bravia::APP_URLS[:primevideo])
    Remo.new.send_signal(Remo::SIGNALS[:amp][:input_opt])
    Windows.new.suspend if input == 'extInput:hdmi'

    @response.add_speech('PrimeVideoを開きました')
  end

  def input_netflix
    bravia = Bravia.new
    input = bravia.selected_input
    bravia.set_active_app(Bravia::APP_URLS[:netflix])
    Remo.new.send_signal(Remo::SIGNALS[:amp][:input_opt])
    Windows.new.suspend if input == 'extInput:hdmi'

    @response.add_speech('Netflixを開きました')
  end
end
