require 'sinatra'
require 'sinatra/activerecord'
require './models/drawing'
require './models/comment'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/hello_kitty2')

get '/' do
  @drawings = Drawing.all
  erb :index
end

post '/save_drawing' do
  dataurl = params[:data]
  Drawing.create!(dataurl: dataurl)
end

get '/drawing/:id' do
  @all_comments = Comment.where('drawing_id = ?', params[:id])
  @drawing = Drawing.find(params[:id])
  erb :drawing
end

get '/dataurl' do
  Drawing.find(params[:id]).dataurl
end

post '/' do
  Comment.create!(text: params['comment_text'], drawing_id: params['drawing_id'])
  redirect '/drawing/#{params[:drawing_id]}'
end


