print("#### CREATING USER ###");
db = db.getSiblingDB("db")

db.createUser({
  user: process.env.MONGO_INITDB_ROOT_USERNAME,
  pwd: process.env.MONGO_INITDB_ROOT_PASSWORD,
  roles: [
    {
      role: 'readWrite',
      db: 'db'
    },
  ],
});

print("#### USER CREATED ####");
print("#### CREATING COLLECTION ####")

db.createCollection('clientes');
db.createCollection('transacoes');

db.clientes.insertMany([
  {
    cliente_id: 1,
    limite: 100000
  },
  {
    cliente_id: 2,
    limite: 80000
  },
  {
    cliente_id: 3,
    limite: 1000000
  },
  {
    cliente_id: 4,
    limite: 10000000
  },
  {
    cliente_id: 5,
    limite: 500000
  }
])

print("#### ALL SET ####")