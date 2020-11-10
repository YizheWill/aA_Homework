# frozen_string_literal: true

# class documentation
require 'rack'
# :NODOC:
class BrowserFilter
  def initialize(app)
    p 'starting the middleware'
    @app = app
  end

  def call(env)
    res = Rack::Response.new

    if env['HTTP_USER_AGENT'].include?('MSIE')
      res.status = 302
      res['location'] = 'https://www.google.com/chrome/'
      res.finish
    else
      @app.call(env)
    end
  end
end

class LoggerMiddleware
  attr_reader :app

  def initialize(app)
    @app = app
  end

  # Rack will call on this one, this is a middleware, so it will write_log first and then call the app, which is the proc
  def call(env)
    write_log(env)
    app.call(env)
  end

  # write logs into a file
  def write_log(env)
    log_file = File.open('application.log', 'a')
    log_text = <<-LOG
    TIME: #{Time.now}
    IP:  #{env['REMOTE_ADDR']}
    PATH: #{env['REQUEST_PATH']}
    ____________________________
    LOG
    log_file.write(log_text)
    log_file.close
  end
end

hey_app = proc do |env|
  res = Rack::Response.new
  file = File.open('index.html', 'r')
  lines = file.read

  res.write(lines)
  res['Content-Type'] = 'text/html'
  res.finish
end

app = Rack::Builder.new do
  use LoggerMiddleware #顺序： 3
  use BrowserFilter #顺序： 2
  run hey_app #顺序 ： 1
end.to_app

Rack::Server.start(app: app, Port: 3000)
