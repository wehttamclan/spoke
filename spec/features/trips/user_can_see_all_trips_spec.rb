require 'rails_helper'

describe "A visitor visits '/trips'" do
  it 'they see the first 30 trips, the details of those trips, and a button to see more trips' do
    station_1 = Station.create(name: 'Test 1', dock_count: 20, city: 'Chicago', installation_date: Date.new(2017, 12, 12))
    station_2 = Station.create(name: 'Test 2', dock_count: 25, city: 'Chicago', installation_date: Date.new(2017, 11, 11))

    duration = 0
    start_date = Date.new(2018, 6, 6)
    end_date = Date.new(2018, 6, 6)
    start_station_id = station_1.id
    end_station_id = station_2.id
    bike_id = 1
    subscription_type = 0
    zip_code = 60446

    31.times do
      Trip.create!(
        duration: duration += 1,
        start_date: start_date,
        end_date: end_date,
        start_station_id: start_station_id,
        end_station_id: end_station_id,
        bike_id: bike_id += 1,
        subscription_type: subscription_type,
        zip_code: zip_code += 1)
      end

    visit trips_path

    expect(page).to have_content("Duration: #{Trip.all.last.duration}")
    expect(page).to have_content("Start Date: #{Trip.all.last.start_date}")
    expect(page).to have_content("End Date: #{Trip.all.last.end_date}")
    expect(page).to have_content("Start Station: #{Trip.all.last.start_station.name}")
    expect(page).to have_content("End Station: #{Trip.all.last.end_station.name}")
    expect(page).to have_content("Bike ID: #{Trip.all.last.bike_id}")
    expect(page).to have_content("Subscription Type: #{Trip.all.last.subscription_type}")
    expect(page).to have_content("Zip Code: #{Trip.all.last.zip_code}")
    expect(page).to_not have_content("Zip Code: #{Trip.all.first.zip_code}")
    expect(page).to have_content('1')
    expect(page).to have_content('Previous')
    expect(page).to have_link('2')
    expect(page).to have_link('Next')
  end
end