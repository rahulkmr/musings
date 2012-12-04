#!/usr/bin/env ruby -w

reader, writer = IO.pipe
4.times do |num|
  fork do
    reader.close
    sleep num
    writer.write "Process #{num}\n"
  end
end
Process.waitall
writer.close
puts reader.read
