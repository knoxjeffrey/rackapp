module Rackapp
  
  class Middleware
    
    attr_accessor :status, :headers, :body
    
    def initialize(app)
      @app = app
    end
    
    def call(env)
      if  env["PATH_INFO"] == '/'
        return [200, {'Content-Type' => 'text/html'}, ["The Visual Page?"] ]
      end
      
      if env["PATH_INFO"] == '/pages'
        return [302, {'Location' => '/pages/about'}, [] ]
      end
      
      controller_class, action = get_controller_and_action(env)
      response = controller_class.new.send(action)
      
      self.status, self.headers, self.body = @app.call(env)
      [200, {'Content-Type' => 'text/html'}, body << "#{response}" ]
    end
    
    def get_controller_and_action(env)
      _, controller_name, action = env["PATH_INFO"].split('/')
      controller_name = controller_name.capitalize + "Controller"
      [Object.const_get(controller_name), action]
    end
  end
  
end