# -*- coding: utf-8 -*-
require 'singleton'

module Smalruby
  # 環境を表現するクラス
  class World
    include Singleton

    attr_accessor :objects
    attr_accessor :board
    attr_reader :sensor_change_queue

    def initialize
      @objects = []
      @board = nil
      @sensor_change_queue = []
      @sensor_change_queue.extend(Mutex_m)
    end

    def sensor_changed(pin, value)
      @sensor_change_queue.synchronize do
        @sensor_change_queue.push([pin, value])
      end
    end
  end
end
