$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'controllers')

Bundler.require
require 'rackapp'

builder = Rack::Builder.new do
  use(Rackapp::Middleware)
  run(Rackapp::Application.new)
end

Rack::Handler::WEBrick.run builder, Port: 3000