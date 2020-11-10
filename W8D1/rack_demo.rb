# frozen_string_literal: true

require 'rack'

# class  documentation
class RackApplication
  def self.call(_env)
    # 进来的数据格式是有要求的，通过这个Rack，就已经能够把httprequest翻译成一个hash了。
    ['200', { 'Content-Type' => 'text/html' }, ["Hello World"]]
    # return 的东西也是要符合标准的，statu code， header， body格式不能错。这就是protocol的一部分。
  end
end
# :NODOC:
class SimpleApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    name = req.params['name'] # params 里面已经有了wildcard，querystring，body。。。所有东西。
    res.write("Hello #{name}")
    # write 这个function自动帮你写好response中的length
    res.finish
    # 返回那个【200， content-type。。。】
  end
end
require 'json'
# :NODOC:
class CookieApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    food = req.params['food']
    # 如果存在food，那么就存在服务器端。
    if food
      res.set_cookie('_my_cookie_app', { path: '/', value: { food: food }.to_json }) # 1 name of cookie, 2 cookie 的一些options，如果path不写的话，这个cookie就会只在那个传过来的url上有效，就是/cats/:id/edit 传过来的cookie，如果不写path，可能就是只在cats/:id/edit上有效，而到了cats/上就用不了了***可能不准确
      # adding something to the headers, rack did it for us.
    else
      cookie = req.cookies['_my_cookie_app']
      # 取回服务器上存的cookie
      cookie_val = JSON.parse(cookie)
      # parse这个取回的json cookie
      food = cookie_val['food']
      # 找到food这个cookie中的选项
      res.write("Your Fav Food is #{food}")
      # 印出来
    end
    res.finish
  end
end

app = proc do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  if req.path.start_with?("/google")
    res.status = 302
    res['location'] = 'https://www.google.com'
  else
    res.write("on current page")
  end
  res.finish
end

Rack::Server.start(app: app, Port: 3000)

