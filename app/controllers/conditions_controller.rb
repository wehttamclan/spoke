class ConditionsController < ApplicationController

  def index
    @conditions = Condition.all
  end

  def show
    @condition = Condition.find(params[:id])
  end

  def dashboard
    @highest_number_of_rides_on_a_day_in_the_30s = Condition.highest_number_of_rides_on_a_day_in_max_temperature_range(30)
    @highest_number_of_rides_on_a_day_in_the_40s = Condition.highest_number_of_rides_on_a_day_in_max_temperature_range(40)
    @highest_number_of_rides_on_a_day_in_the_50s = Condition.highest_number_of_rides_on_a_day_in_max_temperature_range(50)
    @highest_number_of_rides_on_a_day_in_the_60s = Condition.highest_number_of_rides_on_a_day_in_max_temperature_range(60)
    @highest_number_of_rides_on_a_day_in_the_70s = Condition.highest_number_of_rides_on_a_day_in_max_temperature_range(70)
    @highest_number_of_rides_on_a_day_in_the_80s = Condition.highest_number_of_rides_on_a_day_in_max_temperature_range(80)
    @highest_number_of_rides_on_a_day_in_the_90s = Condition.highest_number_of_rides_on_a_day_in_max_temperature_range(90)
    @lowest_number_of_rides_on_a_day_in_the_30s = Condition.lowest_number_of_rides_on_a_day_in_max_temperature_range(30)
    @lowest_number_of_rides_on_a_day_in_the_40s = Condition.lowest_number_of_rides_on_a_day_in_max_temperature_range(40)
    @lowest_number_of_rides_on_a_day_in_the_50s = Condition.lowest_number_of_rides_on_a_day_in_max_temperature_range(50)
    @lowest_number_of_rides_on_a_day_in_the_60s = Condition.lowest_number_of_rides_on_a_day_in_max_temperature_range(60)
    @lowest_number_of_rides_on_a_day_in_the_70s = Condition.lowest_number_of_rides_on_a_day_in_max_temperature_range(70)
    @lowest_number_of_rides_on_a_day_in_the_80s = Condition.lowest_number_of_rides_on_a_day_in_max_temperature_range(80)
    @lowest_number_of_rides_on_a_day_in_the_90s = Condition.lowest_number_of_rides_on_a_day_in_max_temperature_range(90)
  end
end
