class Crebito
  def initialize(id)
    @id = id
  end

  def self.extrato(id:)
    new(id).extrato
  end

  def self.transacao(id:)
  end

  def extrato
    # ...
    {id: @id}
  end

  def transacao
    # ... 
  end
end
