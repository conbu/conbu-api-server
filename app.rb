#!/usr/bin/env ruby
#

require 'sinatra'
require 'pit'
require 'json'

require_relative './place/ten'
$place = @place

get '/' do
  redirect '/v1/version'
end

get '/v1/version' do
  version = '1.0.0'
end

get '/v1/associations/' do
  redirect '/v1/associations/all/'
end

get '/v1/associations/:place' do
  place = params[:place]
  redirect "v1/associations/#{place}/both"
end

get '/v1/associations/:place/:band' do
  place = params[:place]
  band  = params[:band]
  case place
  when 'all'
  when /ap[0-9]{3}/
  when 'entrance', 'unice', 'unit', 'saloon'
  else
    halt 404
  end

  case band
  when /2(_|\.)?4[Gg][Hh][Zz]/
    b = '2.4GHz'
  when /5(_|\.)?0[Gg][Hh][Zz]/
    b = '5GHz'
  when 'both'
  else
    halt 404
  end
  response.headers['Access-Control-Allow-Origin'] = '*'
  content_type :json
  {'associations' => associations(place, b)}.to_json
end

error 404 do
  '404 endpoint not found.'
end

def associations(place, band)
  require 'drb/drb'
  uri = 'druby://localhost:8282'
  DRb.start_service
  zabbix = DRbObject.new_with_uri(uri)
  associations = zabbix.get_associations

  result = 0
  places = $place[:all]
  unless $place.keys.include? place.to_sym
    halt 404 if associations[place.to_s].nil?
    places << place.to_sym
  else
    places = $place[place.to_sym]
  end
  places.each do |ap|
    ap = ap.to_s
    if band == 'both' or band == '2.4GHz' then
      result += associations[ap]['2_4GHz']
    end
    if band == 'both' or band == '5GHz' then
      result += associations[ap]['5GHz']
    end
  end
  result
end

