require 'bundler'
Bundler.setup

require 'sinatra'
require 'haml'

configure { set :server, :puma }
set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  haml :index
end

post '/' do
  @count = params[:count]
  @numbers = Array.new
  @result = Array.new
  @trueCount = Array.new
  @falseCount = Array.new
  @count.each_with_index do |c, i|
    @numbers << c.to_i.times.map { Random.new.rand(0..1) }
    @result << @numbers[i].to_a.each.map { |n| n == 1 ? "Cara" : "Coroa" }
    @trueCount << @numbers[i].to_a.reduce(:+)
    @falseCount << @numbers[i].to_a.length - @trueCount[i].to_i
  end
  haml :result
end