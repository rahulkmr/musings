require 'eventmachine'

class Server < EM::Connection
  def initialize
    @cache = {}
    @buf = ''
  end

  def receive_data(data)
    @buf << data
    @buf.each_line {|line| handle(line) }
    last_newline = @buf.rindex("\r\n") + 2
    if @buf.size == last_newline
      @buf = ''
    else
      @buf = @buf[last_newline..-1]
    end
  end

  def handle(data)
    if @waiting_for_value
      handle_set_value(data)
    else
      cmd = data[0...data.index(/\s+/)]
      if cmd == 'get'
        handle_get(data)
      elsif cmd == 'set'
        handle_set_header(data)
      end
    end
  end

  def handle_get(data)
    key = data.split[1]
    buffer = []
    if val = @cache[key]
      buffer << "VALUE #{key} 0 #{val.size}\r\n"
      buffer << "#{val}\r\n"
    end
    buffer << "END\r\n"
    send_data buffer.join('')
  end

  def handle_set_header(data)
    header = data.split
    @key, @length = header[1], header[4].to_i
    @waiting_for_value = true
  end

  def handle_set_value(data)
    $cache[@key] = data[0...@length]
    @waiting_for_value = false
    send_data "STORED\r\n"
  end
end

EM.run do
  EM.start_server('127.0.0.1', 11211, Server)
end
