load 'database.rb'

class Visitas
	attr_accessor :dni, :fechaVisita, :estado, :codigoDepartamento
	def initialize (dni, fechaVisita, estado,codigoDepartamento)
		@dni = dni
		@fechaVisita = fechaVisita
		@estado = estado
		@codigoDepartamento = codigoDepartamento
	end

	def guardar()
		Database.db_insertarVisita(dni, fechaVisita, estado, codigoDepartamento)
	end

	def buscar(tipo, *arg)
		visitas = []
		case tipo
		when "1" #por fecha
			results = Database.db_buscarVisitasPorFecha(arg[0])
		when "2" #rango fechas
			results = Database.db_buscarVisitasPorRangoFecha(arg[0], arg[1])
		when "3" #dni
			results = Database.db_buscarVisitasPorDni(arg[0])
		when "4" #habitacion
			results = Database.db_buscarVisitasPorHabitacion(arg[0])
		end
		return results
	end
end
