require "mysql2"   
 
class Database
    @db_host  = "svr-condominio.mysql.database.azure.com"
    @db_user  = "upc@svr-condominio"
    @db_pass  = "Developer2019"
    @db_name = "condominio_db"



    def self.db_insertarPersona(dni,nombre,apellido,genero)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "insert into persona(dni,nombre,apellido,genero) values('%s','%s','%s','%s')" % [dni,nombre,apellido,genero]
        $client.query(query)
    end

    def self.db_insertarPropietario(dni)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "insert into propietario(dni) values('%s')" % [dni]
        $client.query(query)
    end

    def self.db_insertarFamiliar(dni, parentesco, dni_propietario)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "insert into familiar(dni,parentesco,dni_propietario) values('%s', '%s', '%s')" % [dni, parentesco, dni_propietario]
        $client.query(query)
    end

    def self.db_existePersona(dni)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "select case when exists (SELECT 1 FROM persona WHERE dni = '%s') then 1 ELSE 0 end as existe" % [dni]
        return $client.query(query)
    end

    #Servicio
    def self.db_insertarServicio(codigo , descripcion, estado)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "insert into servicio(codigo , descripcion, estado) values('%s', '%s', '%s')" % [codigo , descripcion, estado]
        $client.query(query)
    end

    def self.db_listarServicio()
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "select * from  servicio where estado = 'Activo'"
        return $client.query(query)
    end

    def self.db_existeServicio(codigo)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "select case when exists (SELECT 1 FROM servicio WHERE codigo = '%s') then 1 ELSE 0 end as existe" % [codigo]
        return $client.query(query)
    end
    #End Servicio

    def self.db_insertarDepartamento(numero,bloque,descripcion, dni_propietario)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "insert into departamento(numero,bloque,descripcion, dni_propietario) values('%s', '%s', '%s', '%s')" % [numero,bloque,descripcion, dni_propietario]
        $client.query(query)
    end

    def self.db_existeDepartamento(numero)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "select case when exists (SELECT 1 FROM departamento WHERE numero = '%s') then 1 ELSE 0 end as existe" % [numero]
        return $client.query(query)
    end

    #Visitas
    def self.db_insertarVisita(dni, fechaVisita, estado, codigoDepartamento)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "insert into visita(dni, fechaVisita, estado, codigoDepartamento) values('%s', '%s', '%s' , '%s')" % [dni, fechaVisita, estado, codigoDepartamento]
        $client.query(query)
    end

    def self.db_buscarVisitasPorFecha(fechaVisita)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "select * from visita where fechaVisita = '%s'" % [fechaVisita]
        $client.query(query)
    end

    def self.db_buscarVisitasPorRangoFecha(fechaInicio, fechaFin)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "select * from visita where fechaVisita between '%s' and '%s'" % [fechaInicio, fechaFin]
        $client.query(query)
    end

    def self.db_buscarVisitasPorDni(dni)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "select * from visita where dni = '%s'" % [dni]
        $client.query(query)
    end

    def self.db_buscarVisitasPorHabitacion(codigoDepartamento)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "select * from visita where codigoDepartamento = '%s'" % [codigoDepartamento]
        $client.query(query)
    end
    #End Visitas

    #Recibo
    def self.db_insertarRecibo(codigo , codigoServicio, dni_propietario, descripcion, monto, estado)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "insert into recibo(codigo , codigoServicio, dni_propietario, descripcion, monto, estado) values('%s', '%s', '%s' , '%s', '%s' , '%s')" % [codigo , codigoServicio, dni_propietario, descripcion, monto, estado]
        $client.query(query)
    end

    def self.db_existeRecibo(codigo)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "select case when exists (SELECT 1 FROM recibo WHERE codigo = '%s') then 1 ELSE 0 end as existe" % [codigo]
        return $client.query(query)
    end

    def self.db_buscarReciboPorHabitacion(codigoDepartamento)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "select r.* from recibo r inner join departamento d on d.dni_propietario = r.dni_propietario where d.numero = '%s'" % [codigoDepartamento]
        $client.query(query)
    end

    def self.db_buscarReciboDni(dni)
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "select r.* from recibo r where r.dni_propietario = '%s'" % [dni]
        $client.query(query)
    end

    def self.db_buscarReciboDeudores()
        $client = Mysql2::Client.new(:host => @db_host , :username => @db_user, :password => @db_pass, :database =>@db_name)
        query = "select r.* from recibo r where r.estado = 'por pagar' or r.estado = 'no pagado'"
        $client.query(query)
    end
    #End Recibo
end





