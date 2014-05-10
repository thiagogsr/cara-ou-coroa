require 'bundler'
Bundler.setup

require 'sinatra'
require 'haml'

set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  haml :index
end

post '/run' do
  @count = params[:count].to_i
  @numbers = @count.times.map { Random.new.rand(0..1) }
  @result = @numbers.each.map { |n| n == 1 ? "Cara" : "Coroa" }
  @trueCount = @numbers.reduce(:+)
  @falseCount = @numbers.length - @trueCount
  haml :result
end