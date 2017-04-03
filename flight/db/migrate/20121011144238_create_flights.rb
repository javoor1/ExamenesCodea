class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      # Completa con las columnas que necesites
      t.belongs_to :booking
      t.integer :num_flight 
      t.date :date 
      t.time :depart #Verificar por qué requiere comillas
      t.string :from
      t.string :to
      t.time :duration
      t.integer :cost 
      t.integer :passengers
      t.timestamps
    end

    
    create_table :users do |t|
    	# Completa con las columnas que necesites
      t.string :name
      t.string :email
      t.boolean :admin
      t.timestamps
    end


    create_table :user_flights do |t|
      t.belongs_to :user, index: true
      t.belongs_to :flight, index: true
    end


    create_table :bookings do |t|
      t.integer :num_booking
      t.integer :total
      t.integer :flight_id
    end


    create_table :user_bookings do |t|
      t.belongs_to :user, index: true
      t.belongs_to :booking, index: true
    end


    #crea las tablas restantes
  end
end
