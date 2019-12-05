load 'factoria.rb'


class Controlador
    attr_accessor :vista
    def initialize(vista)
   	 @vista = vista
    end

    def registrarPropietario()
        vista.mensaje("=== REGISTRO DE PROPIETARIO ===")
        dni = vista.obtenerDatos("Ingrese el DNI")
        nombre = vista.obtenerDatos("Ingrese el nombre")
        apellido = vista.obtenerDatos("Ingrese el apellido")
        genero = vista.obtenerDatos("Ingrese el genero")
        propietario = Factoria.dameObjeto("Propietario",dni, nombre,apellido, genero)
        existePersona = propietario.existe()

        begin
            if existePersona == "1"
                raise "El Dni de la persona ya existe"
            end
            propietario.guardar()
            vista.mensajeExito()
        rescue => exception
            vista.mensaje(exception.message)
        end
    end

    def registrarFamiliar()
        vista.mensaje("=== REGISTRO DE FAMILIAR ===")
        dni = vista.obtenerDatos("Ingrese el DNI")
        nombre = vista.obtenerDatos("Ingrese el nombre")
        apellido = vista.obtenerDatos("Ingrese el apellido")
        genero = vista.obtenerDatos("Ingrese el genero")
        parentesco = vista.obtenerDatos("Ingrese el parentesco")
        dni_propietario = vista.obtenerDatos("Ingrese el dni del propietario")
        familiar = Factoria.dameObjeto("Familiar",dni, nombre,apellido, genero, parentesco, dni_propietario)
        existePersona = familiar.existe()

        begin
            if existePersona == "1"
                raise "El Dni de la persona ya existe"
            end
            familiar.guardar()
            vista.mensajeExito()
        rescue => exception
            vista.mensaje(exception.message)
        end
    end

    def registrarServicio()
        vista.mensaje("=== REGISTRO DE SERVICIO ===")
        codigo = vista.obtenerDatos("Ingrese el codigo")
        descripcion = vista.obtenerDatos("Ingrese la descripcion")
        estado = vista.obtenerDatos("Ingrese el estado")
        servicio = Factoria.dameObjeto("Servicio",codigo, descripcion, estado)
        existeServicio = servicio.existe()

        begin
            if existeServicio == "1"
                raise "El codigo del servicio ya existe"
            end
            servicio.guardar()
        vista.mensajeExito()
        rescue => exception
            vista.mensaje(exception.message)
        end

    end

    def registrarDepartamento()
        vista.mensaje("=== REGISTRO DE DEPARTAMENTO ===")
        numero = vista.obtenerDatos("Ingrese el numero")
        bloque = vista.obtenerDatos("Ingrese el bloque")
        descripcion = vista.obtenerDatos("Ingrese la descripcion")
        dni_propietario = vista.obtenerDatos("Ingrese el DNI del propietario")
        departamento = Factoria.dameObjeto("Departamento",numero, bloque, descripcion, dni_propietario)
        existeDepartamento = departamento.existe()

        begin
            if existeDepartamento == "1"
                raise "El numero del departamento ya existe"
            end
            departamento.guardar()
            vista.mensajeExito()
        rescue => exception
            vista.mensaje(exception.message)
        end

    end

    def registrarVisita()
        vista.mensaje("=== REGISTRO DE VISITAS ===")
        dni = vista.obtenerDatos("Ingrese el DNI del visitante")
        fechaVisita = vista.obtenerDatos("Ingrese la fecha de visita (yyyy-MM-dd) ")
        estado = vista.obtenerDatos("Ingrese el estado de la visita")
        codigoDepartamento = vista.obtenerDatos("Ingrese el codigo de departamento")
        visitas = Factoria.dameObjeto("Visita",dni, fechaVisita, estado, codigoDepartamento)
        visitas.guardar()
        vista.mensajeExito()
    end

    def registrarRecibos()
        vista.mensaje("=== REGISTRO DE RECIBOS ===")
        codigo = vista.obtenerDatos("Ingrese el codigo del recibo")
        vista.mensaje("Servicios")
        servicio =  Factoria.dameObjeto("Servicio","","","")

        arrayServicios = servicio.listar()
        for s in arrayServicios
            vista.mensaje(" #{s.codigo} -  #{s.descripcion}")
        end
        
        codigoServicio = vista.obtenerDatos("Seleccione el servicio")
        dni_propietario = vista.obtenerDatos("Ingrese dni del propietario")
        descripcion = vista.obtenerDatos("Ingrese la descripcion")
        monto = vista.obtenerDatos("Ingrese el monto")
        estado = vista.obtenerDatos("Ingrese el estado")
        recibo =  Factoria.dameObjeto("Recibo",codigo , codigoServicio, dni_propietario, descripcion, monto, estado)
        existeRecibo = recibo.existe()

        begin
            if existeRecibo == "1"
                raise "El codigo del recibo ya existe"
            end
            recibo.guardar()
            vista.mensajeExito()
        rescue => exception
            vista.mensaje(exception.message)
        end

    end

    def consultarVisitas()
        vista.mensaje("=== BUSQUEDA DE VISITAS ===")
        vista.mensaje("Tipos de filtro")
        vista.mensaje("1 - Por fecha")
        vista.mensaje("2 - Por ranfo de fechas")
        vista.mensaje("3 - Por DNI")
        vista.mensaje("4 - Por departamento")
        tipoFiltro = vista.obtenerDatos("Seleccione el tipo de filtro")
        visita =  Factoria.dameObjeto("Visita",nil , nil, nil, nil, nil, nil)

        case tipoFiltro
		when "1" #por fecha
            fecha = vista.obtenerDatos("Ingrese la fecha (yyyy-MM-dd)")
            visitas = visita.buscar(tipoFiltro,fecha)
		when "2" #rango fechas
            fechaInicio = vista.obtenerDatos("Ingrese la fecha de inicio (yyyy-MM-dd)")
            fechaFin = vista.obtenerDatos("Ingrese la fecha de fin (yyyy-MM-dd)")
            visitas = visita.buscar(tipoFiltro,fechaInicio,fechaFin)
		when "3" #dni
            dni = vista.obtenerDatos("Ingrese el DNI")
            visitas =  visita.buscar(tipoFiltro,dni)
		when "4" #habitacion
            habitacion = vista.obtenerDatos("Ingrese la habitacion")
            visitas = visita.buscar(tipoFiltro,habitacion)
        end
        vista.mostrarListado(visitas)
    end

    def consultarRecibos()
        vista.mensaje("=== BUSQUEDA DE RECIBOS ===")
        vista.mensaje("Tipos de filtro")
        vista.mensaje("1 - Por DNI")
        vista.mensaje("2 - Por departamento")
        tipoFiltro = vista.obtenerDatos("Seleccione el tipo de filtro")
        recibo =  Factoria.dameObjeto("Recibo",nil , nil, nil, nil, nil, nil)

        case tipoFiltro
		when "1" #dni
            dni = vista.obtenerDatos("Ingrese el DNI")
            recibos =  recibo.buscar(tipoFiltro,dni)
		when "2" #habitacion
            habitacion = vista.obtenerDatos("Ingrese la habitacion")
            recibos = recibo.buscar(tipoFiltro,habitacion)
        end
        vista.mostrarListado(recibos)
    end


    def consultarDeudores()
        vista.mensaje("=== BUSQUEDA DE DEUDORES DE RECIBOS ===")
        recibo =  Factoria.dameObjeto("Recibo",nil , nil, nil, nil, nil, nil)
        recibos = recibo.buscarDeudores()
        vista.mostrarListado(recibos)
    end

end