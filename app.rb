require "./environment"
require "pry"

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get "/" do
      erb :root
    end

    get "/new" do
      erb :'./pirates/new'
    end

    post "/pirates" do
      @pirate = Pirate.new(name: params[:pirate][:name], weight: params[:pirate][:weight], height: params[:pirate][:height])

      params[:pirate][:ships].each do |info|
        #binding.pry
        Ship.new(info)
      end
      @ships = Ship.all

      erb :'pirates/show'
    end
  end
end
