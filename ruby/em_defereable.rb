#!/usr/bin/env ruby
require 'eventmachine'

class MyDeferrable
  include EM::Deferrable
  def go(str)
    puts "Go #{str}"
  end
end

EM.run do
  df = MyDeferrable.new
  df.callback do |x|
    df.go(x)
    EM.stop
  end

  EM.add_timer(1) { df.set_deferred_status :succeeded, "SpeedRacer" }
end
