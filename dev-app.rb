#!/usr/bin/env ruby

require 'sinatra'
require 'pit'
require 'json'


get '/' do
  redirect '/v1/version'
end

get '/v1/version' do
  version = '1.0.0'
end

get '/v1/associations' do
  redirect '/v1/associations/all'
end

get '/v1/associations/:place' do
  place = params[:place]
  redirect "/v1/associations/#{place}/both"
end

get '/v1/associations/:place/:band' do
  place = params[:place]
  band  = params[:band]
  case place
  when 'all'
  when 'track_a', 'track_b', 'track_c', 'track_d','track_e'
  else
    halt 404
  end

  case band
  when /2(_|\.)?4[Gg][Hh][Zz]/
    b = '2.4GHz'
  when /5(_|\.)?0[Gg][Hh][Zz]/
    b = '5GHz'
  when 'both'
    b = 'both'
  else
    halt 404
  end
  response.headers['Access-Control-Allow-Origin'] = '*'
  content_type :json
  {'associations' => dummy_associations(place, b)}.to_json
end

error 404 do
  '404 endpoint not found.'
end

def dummy_associations(place, band)
  # 各部屋の Max キャパシティ
  case place
    when "track_a"
      max = 1000
    when "track_b"
      max = 100
    when "track_c"
      max = 120
    when "track_d"
      max = 288
    when "track_e"
      max = 288
    when "all"
      max = 1796
  end
  case (Time.new.sec / 10 % 6).to_i
    when 1
      fluctuation = 0.4
    when 2
      fluctuation = 0.8
    when 3
      fluctuation = 1.2
    when 4
      fluctuation = 1.6
    when 5
      fluctuation = 2.0
    else
      fluctuation = 2.4
  end
  max = max * fluctuation
  
  # 乱数の和を平均させて雑に正規分布っぽくする
  sum = 0
  for i in 1..20 do
    sum += rand() * max
  end
  associations = sum / 20
  
  if band == '2.4GHz' then
    associations = associations * 0.3
  elsif band == '5GHz' then
    associations = associations * 0.7
  end
  (associations).to_i
end
