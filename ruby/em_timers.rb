require 'eventmachine'

EM.run do
  p = EM::PeriodicTimer.new(1) do
    puts "Tick..."
  end

  EM.add_timer(5) do
    puts "BOOM"
    p.cancel
  end

  EM.add_timer(8) do
    puts "Second timer."
    EM.stop
  end
end
