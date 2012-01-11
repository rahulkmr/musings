#!/usr/bin/env ruby
require 'eventmachine'

EM.run do
  EM.add_periodic_timer(1) { puts 'Hi' }

  EM.add_timer(5) do
    EM.next_tick { EM.stop }
  end
end
