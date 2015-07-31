#!/usr/bin/env ruby
#

require 'sinatra'
require 'pit'
require 'zabbixapi'


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
  version = $zabbix.query(
    :method => "apiinfo.version",
    :params => {}
  )
  version
end

