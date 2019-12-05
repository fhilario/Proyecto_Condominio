load 'database.rb'

class Recibo 
	attr_accessor :codigo , :codigoServicio,:dni_propietario, :descripcion, :monto, :estado
	def initialize (codigo , codigoServicio, dni_propietario, descripcion, monto, estado)
		@codigo = codigo
		@dni_propietario = dni_propietario
		@descripcion  = descripcion
		@monto = monto
		@estado = estado
		@codigoServicio = codigoServicio
    end
    
    def guardar()
		Database.db_insertarRecibo(codigo , codigoServicio, dni_propietario, descripcion, monto, estado)
    end

	def buscar(tipo, *arg)
		visitas = []
		case tipo
		when "1" #por DNI
			results = Database.db_buscarReciboDni(arg[0])
		when "2" #habitacion
			results = Database.db_buscarReciboPorHabitacion(arg[0])
		end
		return results
	end

	def buscarDeudores()
		return Database.db_buscarReciboDeudores()
	end

	def existe()
		results = Database.db_existeRecibo(codigo)
		results.each do |row|
			return  row["existe"].to_s()
		end
		return "0"
	end
end