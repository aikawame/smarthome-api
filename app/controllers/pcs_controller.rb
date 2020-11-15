# frozen_string_literal: true

# PCコントローラー
class PcsController < ApplicationController
  def poweron
    AlexaRubykit::build_request(params)
    response = AlexaRubykit::Response.new
    response.add_speech('オンにしました')

    Bravia.new.set_power_status(true)
    Remo.new.send_signal(Remo::SIGNALS[:amp][:power])

    render json: response.build_response
  end

  def input_pc
    responses = []
    bravia = Bravia.new
    responses << bravia.set_hdmi_input(4)
    responses << Remo.new.send_signal(Remo::SIGNALS[:amp][:input_usb])

    render json: responses
  end

  def input_primevideo
    responses = []
    bravia = Bravia.new
    responses << bravia.set_active_app(Bravia::APP_URLS[:primevideo])
    responses << Remo.new.send_signal(Remo::SIGNALS[:amp][:input_opt])

    render json: responses
  end

  def input_netflix
    responses = []
    bravia = Bravia.new
    responses << bravia.input_primevideo
    responses << Remo.new.send_signal(Remo::SIGNALS[:amp][:input_opt])

    render json: responses
  end
end
