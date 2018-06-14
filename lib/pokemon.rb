require 'pry'
class Pokemon
attr_accessor :id, :name, :type, :db

def initialize(id:,name:, type:, db:)
  @id  = id
  @name = name
  @type = type
  @db = db
end

def self.save(name, type, db)
  db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)

end

def self.find(id, db)

  pokemon_id = db.execute("SELECT id FROM pokemon WHERE pokemon.id = id").flatten[0]
  pokemon_name = db.execute("SELECT name FROM pokemon WHERE pokemon.id = id").flatten[0]
  pokemon_type = db.execute("SELECT type FROM pokemon WHERE pokemon.id = id").flatten[0]
Pokemon.new(id: pokemon_id, name: pokemon_name, type: pokemon_type, db: db)
end

end
