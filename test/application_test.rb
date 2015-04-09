require_relative 'test_helper'

class RackappTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    builder = Rack::Builder.new do
      use(Rackapp::Middleware)
      run(Rackapp::Application.new)
    end
  end
  
  def test_root
    get '/'

    assert last_response.ok?
    body = last_response.body
    assert body["The Visual Page?"]
  end
  
  def test_pages
    get '/pages'
    follow_redirect!
    
    assert last_response.ok?
    body = last_response.body
    assert body["I am Jeff"]
  end
  
  def test_pages_about
    get '/pages/about'

    assert last_response.ok?
    body = last_response.body
    assert body["I am Jeff"]
  end
end