class App < Sinatra::Base

    get "/" do
        @content = "Hello from sinatra."
        slim :'main/main'
    end

end
