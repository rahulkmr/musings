#!/usr/bin/env ruby

require 'eventmachine'

EM.run do 
  EM.start_server('127.0.0.1', 9090) do |c|
    def c.receive_data(data)
      p data
      send_data data
      close_connection_after_writing
    end
  end
end
