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
        threads = []
        World.instance.targets.each do |o|
          threads.concat(o.fire(:receive, message))
        end
        threads.each do |t|
          t.join
        end
      end
    end
  end
end
