require 'gossip'


class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}  end

  get '/gossips/new/' do
  	erb :new_gossip end

  post '/gossips/new/' do

    Gossip.new(params['@author'],params['@content']).save
     redirect '/' end


  get '/gossips/:id' do
     erb :show,  locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}  # !! bien mettre les to_i !
    end

  get '/gossips/:id/edit' do
    erb :edit ,   locals: {id: params['id'].to_i} 
   end

  post '/gossips/:id/edit' do
    Gossip.new.update
    redirect '/' end
end