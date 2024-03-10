require_relative './rinha_db'

class Crebito
  def initialize(id)
    @id = id
    @db = RinhaDB.new
  end

  def self.extrato(id:)
    new(id).extrato
  end

  def self.transacao(id:)
  end

  def extrato
    #puts @db.cliente(@id)["limite"]
    {
      saldo: {
        total: saldo,
        data_extrato: DateTime.now,
        limite: @db.cliente(@id)["limite"]
      },
      ultimas_transacoes: @db.ultimas_dez(@id)
    }
  end

  def transacao
    # ...
  end

  def saldo
    transacoes = @db.transacoes(@id)
    if transacoes.empty?
      return 0
    end
    acumulador = 0
    transacoes.each do |transacao|
      if transacao["tipo"] == "c"
        acumulador = acumulador + transacao["valor"].to_i
      elsif transacao["tipo"] == "d"
        acumulador = acumulador - transacao["valor"].to_i
      end

      acumulador
    end
  end
end
