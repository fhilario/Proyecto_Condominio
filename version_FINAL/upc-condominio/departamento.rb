load 'database.rb'

class Departamento
    attr_accessor :numero, :bloque, :descripcion, :dni_propietario
	def initialize (numero,bloque,descripcion, dni_propietario)
		@numero = numero
		@bloque = bloque
		@descripcion = descripcion
		@dni_propietario = dni_propietario
    end
    
    def guardar()
        Database.db_insertarDepartamento(numero,bloque,descripcion, dni_propietario)
    end

    def existe()
		results = Database.db_existeDepartamento(numero)
		results.each do |row|
			return  row["existe"].to_s()
		end
		return "0"
	end
end