require "test/unit"

class Departamento
	attr_accessor :numero, :bloque, :descripcion
	def initialize (numero,bloque,descripcion)
		@numero = numero
		@bloque = bloque
		@descripcion = descripcion
	end

	def muestraDatos
	end

end

class Propietario < Departamento
	attr_accessor :dni , :nombre, :apellido, :genero
	def initialize (numero,bloque,descripcion,dni , nombre, apellido, genero)
		super(numero,bloque,descripcion)
		@dni = dni
		@nombre = nombre
		@apellido  = apellido
		@genero = genero 
	end
	def muestraDatos
		"Nombres: #{nombre} #{apellido}  - DNI: #{dni} - Genero:  #{genero} - #{numero} - #{bloque}- #{descripcion}"
	end
	def dameDNI
		"#{dni}"
	end
end

class SinPropietario < Departamento
	attr_accessor :dni
	def initialize (numero,bloque,descripcion,dni)
		super(numero,bloque,descripcion)
		@dni = dni
	end
	def muestraDatos
		"Nombres: Sin Propietaio "
	end
	def dameDNI
		"#{dni}"
	end
end

class Administrador
	attr_accessor :arregloDepartamento
	def initialize
		@arregloDepartamento = []
	end
	def validarDepartamento(departamento)
		#for p in arregloDepartamento
		#	if p.numero == departamento.numero and p.bloque == departamento.bloque
		#		return true
		#	end
		#end
		return false
	end		

	def registrarDepartamento(departamento)
		flag = validarDepartamento(departamento)
		if flag == true
			return "No se pudo registrar. El departamento ya existe"
		else
			arregloDepartamento.push(departamento)
			return "Registrado con exito"
		end
	end

	def buscarDepartamento(numero)
		for p in arregloDepartamento
			if p.numero == numero 
				return p
			end
		end
		return nil
	end

	def obtenerDepartamento(dni)
		temp = []
		for depa in arregloDepartamento
			if depa.dameDNI == dni
				temp.push(depa)
			end
		end
		return temp
	end
end

class Factoria
  def self.dameObjeto(tipo, *arg)
     case tipo
     when "Propietario"
          return Propietario.new(arg[0], arg[1], arg[2], arg[3],arg[4], arg[5], arg[6])
     when "SinPropietario"
         return SinPropietario.new(arg[0])
     end
  end  
end

class Vista
   def mostrarMensaje(resultado)
   	  puts resultado
   end
   def imprimirListado(arregloDepartamentoDNI)
   	  for ar in arregloDepartamentoDNI
   	  	 puts ar.muestraDatos
   	  end
   end
   def mostrarDepartamento(departamento)
   	puts "Resultado de Busqueda..."
   	if departamento!=nil
      puts departamento.muestraDatos
    else
      puts "No encontrado!!!"
    end
   end
end

class Controlador
   attr_accessor :vista, :administrador
   def initialize(vista, administrador)
   	 @vista = vista
   	 @administrador = administrador
   end
   def registra(tipo, *arg)
      departamento = Factoria.dameObjeto(tipo, *arg)
      resultado = administrador.registrarDepartamento(departamento)
      vista.mostrarMensaje(resultado)
   end
   def obtenerDepartamento(dni)
   	   puts "Lista de departamento con dni propietario : #{dni} "
   	   arregloDepartamentoDNI = administrador.obtenerDepartamento(dni)
   	   vista.imprimirListado(arregloDepartamentoDNI)
   	   puts "-------------------"
   end
   def buscarDepartamento(numero)
   	   departamento = administrador.buscarDepartamento(numero)
   	   vista.mostrarDepartamento(departamento)
   end
end

class TestDepartamento < Test::Unit::TestCase
	
	def setup
		@admin = Administrador.new()
		@vista = Vista.new
		@controlador = Controlador.new(@vista, @admin)
		@controlador.registra("Propietario","703","B05","Departamento con 3 habitaciones","71589688","Diego","Bueno","Masculino")
		@controlador.registra("Propietario","705","B05","Departamento con 3 habitaciones","10469856","Dina","Gamarra","Femenino")
		#@controlador.registra("SinPropietario","105","B05" ,"Departamento con 2 habitaciones","","","","")
		#@controlador.registra("SinPropietario","","","","","108","B05" ,"Departamento con 1 habitación")

	end

	def testListarPropietarios
		@controlador.obtenerDepartamento("71589688")
     	#@controlador.obtenerDepartamento("10469856")
	end

	def testBuscarDepartamento
        @controlador.buscarDepartamento("705")
	end
end



