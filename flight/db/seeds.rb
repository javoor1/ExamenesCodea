# Este archivo sirve para crear registros de prueba

Flight.create(
  num_flight: 1,
  date: '2015-06-15', 
  depart: '13:36:40', #Verificar por qué requiere comillas
  from: 'Sahara',
  to: 'México',
  duration: '7:00:00',
  cost: 3500,
  passengers: 50,
)


User.create(
  name: 'Javier', 
  email: 'javier@mail.com',
  admin: true
)


Booking.create(
num_booking: 123,
total: 2340,
flight_id: 1324,
)



