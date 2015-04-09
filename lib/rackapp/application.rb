

module Rackapp
  
  class Application
  
    STATUS = 200
    HEADERS = {'Content-Type' => 'text/html'}
  
    def call(env)
      [STATUS, HEADERS, []]
    end
    
  end
  
end