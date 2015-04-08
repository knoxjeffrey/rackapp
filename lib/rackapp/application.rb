module Rackapp
  
  class Application
  
    STATUS = 200
    HEADERS = {'Content-Type' => 'text/html'}
  
    def self.call(env)
      [STATUS, HEADERS, body]
    end
  
    def self.body
      ["Hey there"]
    end
  end
  
end