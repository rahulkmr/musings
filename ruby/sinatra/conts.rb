require 'sinatra'
require 'continuation'
require 'ruby-debug'

$counter = 0
$fnids = {}

set :server, %w[webrick]

def dispatch_fn(fnid)
  fn = $fnids[fnid.to_i]
  if fn.nil?
    'Unknown or expired link'
  else
    debugger
    fn[]
  end
end

get '/' do
  if (fnid = params[:fnid])
    dispatch_fn fnid
  else
    return <<-EOF
        <form method="post">
            <input name="name" />
            <input type="submit" />
        </form>
    EOF
  end
end

post '/' do
  name = params[:name]
  callcc {|k|
    $fnids[$counter += 1] = k
    halt "<a href=\"?fnid=#{$counter}\">Click here</a>"
  }
  "Hello #{name}"
end
