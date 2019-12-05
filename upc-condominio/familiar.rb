load 'persona.rb'
load 'database.rb'

class Familiar  < Persona
    attr_accessor :parentesco, :dni_propietario
	def initialize (dni, nombre,apellido, genero, parentesco, dni_propietario)
		super(dni, nombre,apellido, genero)
		@parentesco = parentesco
		@dni_propietario = dni_propietario
	end

	def guardar()
		super
		Database.db_insertarFamiliar(dni, parentesco, dni_propietario)
	end
end