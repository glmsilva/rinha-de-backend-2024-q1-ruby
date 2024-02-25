require './rinha/lib/crebito.rb'

module Middleware
  class RequestHandler
    def initialize(app)
      @app = app
    end

    def call(env)
      id, rota = env['request_parser_var'].split(',') # pega id e ação

      [200, {}, ['Middleware 2']]
    end
  end
end
