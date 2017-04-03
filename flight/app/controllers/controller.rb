class Controller 
  def initialize(args)
    puts "argv = #{ARGV[0].to_i}"
    @view = View.new
    index
  end

  def flight_reservations
    puts 'Introduce tu número de vuelo'
    search_id = gets.chomp.to_i
    p result = Booking.find_by_num_booking(search_id)
    @view.flight(result)
  end

  def flight_lookup
    puts 'Busca un vuelo'
    puts 'lugar de partida'
    from = gets.chomp
    puts 'lugar de destino'
    to = gets.chomp
    puts 'fecha de destino'
    date = gets.chomp
    p result = Flight.where(from: from).where(to: to)#.where(date: date)
    @view.index_flight(result, from, to)
    @flight_option = gets.chomp.to_i
    @flight = result[@flight_option-1]
    puts "Número de pasajeros"
    @passengers = gets.chomp.to_i
    #@view.booking_ticket(@flight)
    puts "Número de vuelo seleccionado: #{@flight.num_flight}"
    puts ":Datos de Persona"
    puts "Ingresa tu nombre: "
    name = gets.chomp
    puts "Ingresa tu correo: "
    email = gets.chomp
    find_user = User.where(name: name).where(email: email)
    if find_user[0].nil?
      user = User.create(name: name, email: email, admin: false)
    else
      user = find_user  
    end
    booking(@flight, @passengers, user)
  end

  def booking(flight, passengers, user)
    booking = Booking.create(num_booking: rand(1230..300),
      total: @flight.cost * passengers,
      flight_id: rand(1230..3000)
    )
    p user.bookings << booking
  end


  def index #incluimos los casos existentes
    # TIP: Aquí debes de llamar al método del mismo nombre de @view
    puts 'dentro de Controller - index'
    @action = gets.chomp.to_i
    case @action
    #puts 'dentro de index case'
    when 1 #reservaciones
      @view.reservaciones
      option = gets.chomp.to_i
      if option == 1
        flight_reservations
      elsif option == 2
        flight_lookup
      else 
        @view.salir        
      end
      #index


    when 2 # menú administrador
      @view.administrador_1
      @view.administrador_2
      option = gets.chomp.to_i
      
      case option
      when 1 
        vuelos = Flight.all
        @view.index_flight(vuelos)
      when 2
        reservaciones = Booking.all
        @view.index_reservaciones(reservaciones)
      when 3
        puts 'Introduce el número de vuelo'
        num_flight = gets.chomp.to_i
        puts 'Introduce fecha en formato aaaa/mm/dd'
        date = gets.chomp
        puts 'Introduce hora de salida hh:mm:ss'
        depart = gets.chomp
        puts 'Introduce lugar de salida'
        from = gets.chomp
        puts 'Introduce lugar de destino'
        to = gets.chomp
        puts 'Introduce duración del vuelo hh.mm.ss'
        duration = gets.chomp
        puts 'Introduce el costo del vuelo'
        cost = gets.chomp.to_i
        puts 'Introduce el número de pasajeros'
        passengers = gets.chomp.to_i

        Flight.create(
          num_flight: num_flight,
          date: date, 
          depart: depart,
          from: from,
          to: to,
          duration: duration,
          cost: cost,
          passengers: passengers,
          )
        p Flight.last

      when 4
        @view.salir
      end

    when 3 #salir
      @view.salir
    end
  end

  

end


