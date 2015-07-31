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



get '/' do
  
end

