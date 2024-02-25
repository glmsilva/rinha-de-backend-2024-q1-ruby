module Middleware
  class RequestParser
    def initialize(app)
      @app = app
    end

    def call(env)
      _, clientes, id, rota = Rack::Request.new(env)
        .path_info
        .then { |path| path.split('/') }
      
      if valid_id?(id)
        case rota
        when 'extrato'
          if env['REQUEST_METHOD'] != 'GET'
            return bad_request
          end
          env['request_parser_var'] = [id, rota].join(',') # salva id e ação
        when 'transacao'
          if env['REQUEST_METHOD'] != 'POST'
            return bad_request
          end
          env['request_parser_var'] = [id, rota].join(',')
        else
          return bad_request
        end

        status, headers, body = @app.call(env)
        [status, headers, body]
      else
        bad_request
      end
    end

    private

    def valid_id?(id)
      begin
        Integer(id).is_a?(Integer)
      rescue TypeError, ArgumentError => e
        return false
      end
    end

    def bad_request
      return [404, {}, [{ message: "Vixi, deu ruim"}.to_json]]
    end
  end
end
