# frozen_string_literal: true

# PCコントローラー
class PcsController < ApplicationController
  def poweron
    responses = []
    responses << Bravia.new.set_power_status(true)
    responses << Remo.new.send_signal(Remo::SIGNALS[:amp][:power])

    render json: responses
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
