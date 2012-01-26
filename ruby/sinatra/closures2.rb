require 'sinatra/reloader'
require 'sinatra'

$fnids = {}
$counter = 0

def store_fn(fn)
  ($fnids[$counter += 1] = fn) and $counter
end

def dispatch_fn(fnid)
  fn = $fnids[fnid]
  fn.nil? && 'Unknown or expired link' || fn[]
end

before do
  halt dispatch_fn(params[:fnid].to_i) if params[:fnid]
end

get '/' do
  <<-EOF
    <form method="post">
        <input name="name" />
        <input type="submit" />
    </form>
  EOF
end

post '/' do
  show_name = -> { "Hello #{params[:name]}" }
  '<a href="?fnid=%s">Click here</a>' % store_fn(show_name)
end
