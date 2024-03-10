require 'mongo'

class RinhaDB
  DB_CFG = {
    name: 'db',
    user: 'rinha',
    password: 'senhasecreta',
    auth_source: 'admin'
  }

  def initialize
    @db ||= Mongo::Client.new([DB_CFG[:name]],
                           user: DB_CFG[:user],
                           password: DB_CFG[:password],
                           database: DB_CFG[:name],
                           auth_source: DB_CFG[:auth_source]
                           )
  end

  def pega_documentos(id, colecao)
    @db[colecao].find(:cliente_id => id)
  end

  def cliente(id)
    pega_documentos(id, "clientes").limit(1)
                                   .to_a
                                   .first
  end

  def ultimas_dez(id)
    pega_documentos(id, "transacao").limit(10).sort({data_transacao: -1}).to_a
  end

  def transacoes(id)
    pega_documentos(id, "transacao").to_a
  end
end
