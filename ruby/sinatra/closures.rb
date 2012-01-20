require 'sinatra/reloader'
require 'sinatra'
require 'slim'

$fnids = {}
$counter = 0

def w_link(&next_call)
  @fnid = $counter += 1
  $fnids[$counter] = next_call
  slim :w_link
end

get '/' do
  if (fnid = params[:fnid])
    $fnids[fnid.to_i].call
  else
    slim :form
  end
end

post '/' do
  name = params[:name]
  w_link do
    "Hello #{name}"
  end
end

__END__

@@form
form method="post"
  input type="text" name="name"
  input type="submit"

@@w_link
a href="?fnid=#{@fnid}" Click here
