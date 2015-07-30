require_relative '../conbu'

require 'jsonrpc-client'

class CONBU::Zabbix
  def initialize(user, password)
    @user = user
    @password = password
    @client = JSONRPC::Client.new('http://zabbix.conbu.net/api_jsonrpc.php')
    @id = 0
    @auth = nil
  end

  def user_login(user = @user, password = @password)
    params = {
      'user' => user,
      'password' => password
    }
    auth = invoke('user.login', params, false)
    @auth = auth
  end

  def invoke(method, params, login = true)
    if @auth.nil? and login then
      user_login
    end
    @id += 1
    params['id'] = @id
    @client.invoke(method.to_s, params)
  end
end


if __FILE__ == $0 then
  z = CONBU::Zabbix.new('takano32', 'XXXXXX')
  puts z.user_login
end


