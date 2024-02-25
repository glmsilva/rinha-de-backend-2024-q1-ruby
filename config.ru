require 'rack'
require 'json'
require './rinha/lib/middleware/request_parser'
require './rinha/lib/middleware/request_handler'

app = Rack::Builder.app do
  use Middleware::RequestParser
  use Middleware::RequestHandler
  run do |env| 
    [200, {"Content-Type" => "text/plain"}, ["OK"]]
  end
end

run app
