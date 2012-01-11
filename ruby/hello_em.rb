#!/usr/bin/env ruby
require 'eventmachine'

class Echo < EM::Connection
  def receive_data(data)
    send_data(data)
  end
end

EM.run do
  EM.start_server('0.0.0.0', 10000, Echo)
end
