$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

Bundler.require
require 'rackapp'

builder = Rack::Builder.new do
  use(Rack::Runtime)
  use(Rackapp::Middleware)
  run(Rackapp::Application)
end

Rack::Handler::WEBrick.run builder, Port: 3000