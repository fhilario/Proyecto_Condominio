load 'vista.rb'
load 'controlador.rb'


def main_program
    inicio()
end

def inicio
    vista = Vista.new()
    controlador = Controlador.new(vista);

    opcion = menu
    case opcion
    when "1"
        controlador.registrarPropietario()
    when "2"
        controlador.registrarFamiliar()
    when "3"
        controlador.registrarServicio()
    when "4"
        controlador.registrarDepartamento()
    when "5"
        controlador.registrarVisita()
    when "6"
        controlador.registrarRecibos()
    when "7"
        controlador.consultarVisitas()
    when "8"
        controlador.consultarRecibos()
    when "9"
        controlador.consultarDeudores()
    else
        puts "Opcion inválida"
    end
    inicio
end

def menu
    puts "   "
    puts "   "
    puts "Ingrese una opción del menu"
    puts "1 - Registrar de propietario"
    puts "2 - Registrar de familiar"
    puts "3 - Registrar servicio"
    puts "4 - Registrar de departamento"
    puts "5 - Registrar Visita"
    puts "6 - Registrar Recibos"
    puts "7 - Consultar visitas"
    puts "8 - Consultar recibos"
    puts "9 - Consulta de deudores de recibos"
    opcion = gets.chomp
    return opcion
end

main_program
