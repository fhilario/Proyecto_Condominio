load 'persona.rb'
load 'database.rb'

class Propietario  < Persona
	def initialize (dni, nombre,apellido, genero)
		super(dni, nombre,apellido, genero)
	end

	def guardar()
		super
		Database.db_insertarPropietario(dni)
	end

	
end