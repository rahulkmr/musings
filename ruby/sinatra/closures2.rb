require 'sinatra'

$fnids = {}
$counter = 0

def new_fnid(fn)
  $counter += 1
  $fnids[$counter] = fn
  $counter
end

def dispatch_fn(fnid)
  fn = $fnids[fnid.to_i]
  if fn.nil?
    'Unknown or expired link'
  else
    fn[]
  end
end

def w_link(&fn)
  $fnids[$counter += 1] = fn
  '<a href="?fnid=%s">Click here</a>' % $counter
end

get '/' do
  if (fnid = params[:fnid])
    dispatch_fn fnid
  else
    <<-EOF
        <form method="post">
            <input name="name" />
            <input type="submit" />
        </form>
    EOF
  end
end

post '/' do
  name = params[:name]
  w_link do
    "Hello #{name}"
  end
end
