require 'rack/test'
require 'test/unit'

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", 'lib')
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", 'controllers')

require 'rackapp'