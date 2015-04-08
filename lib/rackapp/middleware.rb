module Rackapp
  
  class Middleware
    
    attr_accessor :status, :headers, :body
    
    def initialize(app)
      @app = app
    end
    
    def call(env)
      self.status, self.headers, self.body = @app.call(env)
      [status, headers, body]
    end
  end
  
end