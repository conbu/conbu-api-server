#!/usr/bin/env ruby
#

require 'sinatra'
require 'pit'
require 'zabbixapi'
require 'json'

require_relative './place/ten'
$place = @place

$zabbix_config = Pit.get('zabbix',
                  :require => {
  user: 'zabbix username',
  password: 'zabbix password',
})

$zabbix = ZabbixApi.connect(
  :url => 'http://zabbix.conbu.net/api_jsonrpc.php',
  :user => $zabbix_config[:user],
  :password => $zabbix_config[:password]
)

$associations = {}

get '/' do
  redirect '/v1/version'
end

get '/v1/version' do
  version = $zabbix.query(
    :method => "apiinfo.version",
    :params => {}
  )
  version = '1.0.0'
end

get '/v1/:place/associations/' do
  place = params[:place]
  redirect "v1/#{place}/associations/all"
end

get '/v1/:place/associations/:band' do
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
  when 'all'
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
  "#{place}: #{band}"
  items = $zabbix.items.get(output: 'extend')
  items.each do |item|
    next unless item['name'] =~ /(ap[0-9]{3})/
    next unless item['name'] =~ /(ap[0-9]{3}).+((2\.4|5)GHz)/
    ap = $1
    band = $2.sub('.', '_')
    $associations[ap] = {} if $associations[ap].nil?
    $associations[ap][band] = item['lastvalue'].to_i
  end

  result = 0
  unless $place.keys.include? place.to_sym
    halt 404 if $associations[place.to_s].nil?
  end
  $place[:all].each do |ap|
    ap = ap.to_s
    result += $associations[ap]['2_4GHz']
    result += $associations[ap]['5GHz']
  end
  result
end

