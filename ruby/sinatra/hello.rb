require 'sinatra/reloader'
require 'sinatra'
require 'slim'

get '/' do
  slim :index
end

get '/greet.?:format?' do
  params[:format]
end

get '/stream' do
  stream do |out|
    out << "First message\n"
    sleep 1
    out << "Second message\n"
    sleep 2
    out << "Third message\n"
  end
end

__END__

@@layout
doctype 5
html
  head
    title Inline templates
  body
    == yield

@@index
p Hello world
