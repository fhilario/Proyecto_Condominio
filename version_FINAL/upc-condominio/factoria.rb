load 'familiar.rb'
load 'servicio.rb'
load 'departamento.rb'
load 'visitas.rb'
load 'recibo.rb'
load 'propietario.rb'

class Factoria
    def self.dameObjeto(tipo, *arg)
      case tipo
      when "Familiar"
         return Familiar.new(arg[0], arg[1], arg[2], arg[3],arg[4], arg[5])
      when "Propietario"
         return Propietario.new(arg[0], arg[1], arg[2], arg[3])
      when "Servicio"
            return Servicio.new(arg[0], arg[1], arg[2])
      when "Departamento"
         return Departamento.new(arg[0], arg[1], arg[2], arg[3])
      when "Visita"
         return Visitas.new(arg[0], arg[1], arg[2], arg[3])
      when "Recibo"
         return Recibo.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5])
       end
    end  
  end
  