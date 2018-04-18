class FlightsController < ApplicationController

	def index
		@airports = Airport.all
		if params.has_key?(:from_airport_id)
			date = "#{params[:date][:day]}/#{params[:date][:month]}/#{params[:date][:year]}"
			@passenger_count = params[:passenger_count]
			@flights = Flight.find_available(params[:from_airport_id],
																			 params[:to_airport_id],
																			 @passenger_count,
																			 date)
		end
	end
end
