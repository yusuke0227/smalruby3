module Smalruby3
  module SpriteMethod
    # Events category methods
    module Events
      def when(event, *options, &block)
        event = event.to_sym
        @event_handlers[event] ||= []
        h = EventHandler.new(self, options, &block)
        @event_handlers[event] << h
      end

      def broadcast(message)
        World.instance.targets.each do |o|
          o.fire(:receive, message)
        end
      end

      def broadcast_and_wait(message)
        id = "1"
        World.instance.targets.each do |o|
          World.instance.fire_receive_messages[id] ||= []
          World.instance.fire_receive_messages[id] << o
          o.fire(:receive, message)
          
        end
        loop do
          if World.instance.fire_receive_messages.empty?
            break
          end
          wait
        end
      end
    end 
  end
end
