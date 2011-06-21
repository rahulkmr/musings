require 'sinatra'

get '/tts' do
  [200, {'Content-type' => 'audio/mpeg'}, `espeak '#{params[:text]}' --stdout | lame -`]
end
