require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')


get('/') do
  @is_alive = Tamagotchi.is_alive()
  @sleep_level = Tamagotchi.sleep_level()
  @activity_level = Tamagotchi.activity_level()
  @food_level = Tamagotchi.food_level()
  if @is_alive && @sleep_level > 0 && @activity_level > 0 && @food_level > 0
    a = Thread.new do
      while Tamagotchi.is_alive() do
        Tamagotchi.time_passes()
        sleep 2
        Thread.kill(a)
      end
    end
    erb(:index)
  else
    Tamagotchi.ressurect()
    erb(:death)
  end
end

post('/feed') do
  Tamagotchi.feed()
  redirect('/')
end

post('/sleep') do
  Tamagotchi.sleep()
  redirect('/')
end

post('/play') do
  Tamagotchi.play()
  redirect('/')
end

post('/death') do
  erb(:death)
end
