require './rinha/lib/crebito.rb'

module Middleware
  class RequestHandler
    def initialize(app)
      @app = app
    end

    def call(env)
      _, clientes, id, action = Rack::Request.new(env)
        .path_info
        .then { |path| path.split('/') }

      case action
      when "extrato"
        id = Crebito.extrato(id: id)
        [200, {'Content-Type'=> 'application/json'}, [{extrato: id }.to_json]]
      when "transacao"
        puts "transacao"
        [200, {}, ['OK: 2']]
      else
        [404, {}, [{ message: "Vixi, deu ruim"}.to_json]]
      end
    end
  end
end
