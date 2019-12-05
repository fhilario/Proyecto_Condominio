load 'database.rb'

class Servicio 
	attr_accessor :codigo , :descripcion, :estado
	def initialize (codigo , descripcion, estado)
		@codigo = codigo
		@descripcion = descripcion
		@estado  = estado
	end
    
    def guardar()
		Database.db_insertarServicio(codigo , descripcion, estado)
	end

	def listar()
		servicios = []
		results = Database.db_listarServicio()
		results.each do |row|
			servicio = Factoria.dameObjeto("Servicio",row["codigo"].to_s(), row["descripcion"].to_s(), row["estado"].to_s())
			servicios.push(servicio)
		end
		return servicios
	end 

	def existe()
		results = Database.db_existeServicio(codigo)
		results.each do |row|
			return  row["existe"].to_s()
		end
		return "0"
	end
	
end