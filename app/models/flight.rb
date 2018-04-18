class Flight < ApplicationRecord

	belongs_to :from_airport, class_name: "Airport"
	belongs_to :to_airport, 	class_name: "Airport"
	has_many 	 :bookings
	has_many 	 :passengers, through: :bookings

	def self.find_available(from, to, passenger_count, date)
		date = Time.parse(date)
		Flight.where('from_airport_id = ?
								 AND to_airport_id = ?
								 AND available_seat_count >= ?', 
								 from, to, passenger_count)
					.where(departing_time: date.all_day)
	end

	def format_departing_time
		departing_time.localtime.strftime('%A, %-m/%-d/%Y %I:%M %p')
	end
end
