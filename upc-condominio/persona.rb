load 'database.rb'

class Persona
	attr_accessor :dni, :nombre, :apellido, :genero
	def initialize (dni, nombre,apellido, genero)
		@dni = dni
		@nombre = nombre
		@apellido = apellido
		@genero = genero
	end
	
	def guardar()
		Database.db_insertarPersona(dni, nombre,apellido, genero)
	end

	def existe()
		results = Database.db_existePersona(dni)
		results.each do |row|
			return  row["existe"].to_s()
		end
		return "0"
	end
end