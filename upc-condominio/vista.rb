
require 'hirb'

class Vista
    def obtenerDatos( texto )
        puts texto
        return gets.chomp
    end

    def mensajeExito()
        puts "******** Se guardo el registro ********"
    end

    def mensaje(texto)
        puts texto
    end

    def mostrarListado(array)
        puts Hirb::Helpers::AutoTable.render(array)
    end
end