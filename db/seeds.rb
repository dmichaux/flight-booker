# Delete previous seeds in Development
if Rails.env.development?
	Airport.delete_all
	Flight.delete_all
end

# Airports

@phl = Airport.create(code: "PHL")
@lax = Airport.create(code: "LAX")
@jfk = Airport.create(code: "JFK")

# Flights
# Seeds 4 weeks worth of flights, 2 flights per day

# PHL -> LAX
56.times do |n|
	Flight.create(departing_time: Time.zone.now + (n * 12).hours,
								duration: 21600, # 6 hours
								available_seat_count: 100,
								from_airport_id: @phl.id,
								to_airport_id: @lax.id)
end

# PHL -> JFK
56.times do |n|
	Flight.create(departing_time: Time.zone.now + (n * 12).hours,
								duration: 3600, # 1 hour
								available_seat_count: 100,
								from_airport_id: @phl.id,
								to_airport_id: @jfk.id)
end

# LAX -> PHL
56.times do |n|
	Flight.create(departing_time: Time.zone.now + (n * 12).hours,
								duration: 21600, # 6 hours
								available_seat_count: 100,
								from_airport_id: @lax.id,
								to_airport_id: @phl.id)
end

# LAX -> JFK
56.times do |n|
	Flight.create(departing_time: Time.zone.now + (n * 12).hours,
								duration: 23400, # 6.5 hours
								available_seat_count: 100,
								from_airport_id: @lax.id,
								to_airport_id: @jfk.id)
end

# JFK -> PHL
56.times do |n|
	Flight.create(departing_time: Time.zone.now + (n * 12).hours,
								duration: 3600, # 1 hour
								available_seat_count: 100,
								from_airport_id: @jfk.id,
								to_airport_id: @phl.id)
end

# JFK -> LAX
56.times do |n|
	Flight.create(departing_time: Time.zone.now + (n * 12).hours,
								duration: 23400, # 6.5 hours
								available_seat_count: 100,
								from_airport_id: @jfk.id,
								to_airport_id: @lax.id)
end
