# -*- coding: utf-8 -*-

DESCRIPTION = <<EOS
RGB LED(アノードコモン)の色を変化させます
EOS

# デジタルの3番、4番、5番、6番ピンにそれぞれR、コモン、G、Bを接続してく
# ださい。

require 'smalruby'

init_hardware

scene1 = Scene.new(color: 'white')

scene1.on(:start) do
  draw_font(string: DESCRIPTION, color: 'black')

  loop do
    rgb_led_anode('D3').on(color: 'red')
    sleep(1)
    rgb_led_anode('D3').on(color: 'green')
    sleep(1)
    rgb_led_anode('D3').on(color: 'blue')
    sleep(1)
    rgb_led_anode('D3').off
    sleep(1)
  end
end
