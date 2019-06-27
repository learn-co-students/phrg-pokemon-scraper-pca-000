require "pry"
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id:, name:, type:, hp: nil, db:)
    @name = name
    @type = type
    @db = db
    @hp = hp
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
    puts "hello"
  end
end
