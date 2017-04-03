class View
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario
  # Los siguientes métodos son sólo un ejemplo:
  def initialize
    bienvenida
  end


  def bienvenida
    puts 'Bienvenido a Vuelos Codea'
    puts '--------------------------------------------------'
    puts '1) Reservaciones'
    puts '2) Administrador'
    puts '3) Salir'
    puts 'Selecciona opción:'    
  end

	def reservaciones
    puts '-' * 45 
    puts '            ¡¡¡Bienvenido!!!     '
    puts '-' * 45 
    puts '1) Encuentra tu boleto de avión'
    puts '2) Encuentra vuelos'
    puts '3) Salir'
    puts 'Selecciona una opción:'
	end


  def flight(result)
    puts "Tu vuelo es el siguiente: #{result}"
  end


  def administrador_1
    puts 'Bienvenido Administrador'
    puts '-' *45
    puts 'Ingrese usuario:'
    usuario = gets.chomp
    puts 'Ingrese contraseña:'
    contraseña = gets.chomp
  end

  def administrador_2
    puts 'Bienvenido Administrador'
    puts '--------------------------------------------------'
    puts '1) Muestra todos los vuelos'
    puts '2) Muestra todas las reservaciones'
    puts '3) Crea un nuevo vuelo'
    puts '4) Salir'
    puts 'Selecciona opción:'
  end

  def index_flight(lista_vuelos, from, to)
    puts "Vuelos disponibles From: #{from} To: #{to}"
    puts "---------------------------------------------------------------------"
    #p lista_vuelos
    lista_vuelos.each_with_index do |objeto_flight, index|
      puts "1) No. Vuelo #{objeto_flight.num_flight}"
      puts "Date: #{objeto_flight.date}, Depart: #{objeto_flight.depart},/n From: #{objeto_flight.from}, To: #{objeto_flight.to},"
      puts "Duration: #{objeto_flight.duration}, Precio: #{objeto_flight.cost}, Lugares: #{objeto_flight.passengers}"
      puts "Selecciona tu vuelo"
    end

  end

  def index_reservaciones(reservaciones)
    p reservaciones
    reservaciones.each_with_index do |objeto_flight, index|
      puts "1) No. Vuelo #{objeto_flight.num_flight}"
      puts "Date: #{objeto_flight.date}, Depart: #{objeto_flight.depart},/n From: #{objeto_flight.from}, To: #{objeto_flight.to},"
      puts "Duration: #{objeto_flight.duration}, Precio: #{objeto_flight.cost}, Lugares: #{objeto_flight.passengers}"
      puts "Selecciona tu vuelo"
    end
  end

  def booking_ticket(flight)
    # puts "Número de vuelo seleccionado: #{flight.num_flight}"
    # puts ":Datos de Persona"
    # puts "Ingresa tu nombre: "
    # puts "Ingresa tu correo: "
  end

  def salir
    puts 'Gracias por visitarnos regrese pronto'
  end



  #  def create
  #  end

  #  def delete
  #  end

  #  def update
  #  end

  # def error
  # end
end
