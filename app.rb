#!/usr/bin/env ruby
#

require 'sinatra'
require 'jsonrpc-client'

get '/' do
  client = JSONRPC::Client.new('http://zabbix.conbu.net/api_jsonrpc.php')
  params = {
    'jsonrpc' => '2.0',
    'method' => 'apiinfo.version',
    'id' => 1,
    'auth' => nil,
    'params' => {},
  }
  result = client.invoke('apiinfo.version', params)
end

