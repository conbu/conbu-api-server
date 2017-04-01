#!/usr/bin/env ruby
# vim: set et sts=2 sw=2 ts=2 fdm=marker ft=ruby :
# author: TAKANO Mitsuhiro a.k.a. @takano32
#

require 'sinatra'
require 'pit'
require 'json'

require_relative './location/elixirconf2017'
$location = @location

require 'drb/drb'
uri = 'druby://localhost:8282'
DRb.start_service
$zabbix = DRbObject.new_with_uri(uri)

get '/' do
  redirect '/v1/version'
end

get '/v1/version' do
  version = '1.0.0'
end

get '/v1/associations' do
  redirect '/v1/associations/all'
end

get '/v1/associations/:location' do
  location = params[:location]
  redirect "/v1/associations/#{location}/both"
end

get '/v1/associations/:location/:band' do
  location = params[:location]
  band  = params[:band]
  case location
  when 'all'
  when /APL[0-9]{1,3}/
  when *$location.keys.map(&:to_s)
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
  # {'associations' => dummy_associations(location, b)}.to_json
  {'associations' => associations(location, b)}.to_json
end

error 404 do
  '404 endpoint not found.'
end

def associations(location, band)
  associations = $zabbix.get_associations

  result = 0
  locations = $location[:all]
  unless $location.keys.include? location.to_sym
    halt 404 if associations[location.to_s].nil?
    locations = [location.to_sym]
  else
    locations = $location[location.to_sym]
  end
  locations.each do |ap|
    ap = ap.to_s
    next unless associations.has_key? ap
    if band == 'both' or band == '2.4GHz' then
      result += associations[ap]['2_4GHz']
    end
    if band == 'both' or band == '5GHz' then
      result += associations[ap]['5GHz']
    end
  end
  result
end

