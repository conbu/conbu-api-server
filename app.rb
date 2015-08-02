#!/usr/bin/env ruby
#

require 'sinatra'
require 'pit'
require 'zabbixapi'

require_relative './place/ten'
p @place

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
  redirect "v1/#{place}/associations/total"
end

get '/v1/:place/associations/:band' do
  place = params[:place]
  band  = params[:band]
  case place
  when 'total'
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
  when 'total'
  else
    halt 404
  end
  associations(place, b)
end

error 404 do
  '404 endpoint not found.'
end

def associations(place, band)
  "#{place}: #{band}"
end

