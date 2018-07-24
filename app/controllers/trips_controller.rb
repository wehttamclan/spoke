class TripsController < ApplicationController

  def index
    @trips = Trip.search(params[:page])
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def dashboard
    @average_ride_duration = Trip.average_ride_duration
    @longest_ride_duration = Trip.longest_ride_duration
    @shortest_ride_duration = Trip.shortest_ride_duration
    @most_frequent_start_station = Trip.most_frequent_start_station
    @most_frequent_end_station = Trip.most_frequent_end_station
  end
end
