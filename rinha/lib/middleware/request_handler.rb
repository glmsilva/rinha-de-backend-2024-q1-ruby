require './rinha/lib/crebito.rb'
require 'json'

module Middleware
  class RequestHandler
    def initialize(app)
      @app = app
    end

    def call(env)
      id, rota = env['request_parser_var'].split(',') # pega id e ação

      if rota == "extrato"
        resposta = Crebito.extrato(id: id.to_i).to_json
        return [200, {'content-type' => 'application/json'}, [resposta]]
      end
      [200, {'content-type' => 'application/json'}, [{ msg: "aqui" }.to_json]]
    end
  end
end
