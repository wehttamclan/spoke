require 'rails_helper'

describe 'when user visits /cart' do
  before(:each) do
    user = User.create!(username: 'happyharry', email: 'email@email.email', password: 'turtles')
    @accessory1 = Accessory.create!(title: 'title1', description: 'desc1', price: 11.00)
    accessory2 = Accessory.create!(title: 'title2', description: 'desc1', price: 23.33)
    accessory3 = Accessory.create!(title: 'title3', description: 'desc1', price: 23.33)
    accessory4 = Accessory.create!(title: 'title4', description: 'desc1', price: 23.33)
    accessory5 = Accessory.create!(title: 'title5', description: 'desc1', price: 23.33)
    accessory6 = Accessory.create!(title: 'title6', description: 'desc1', price: 23.33)
    accessory7 = Accessory.create!(title: 'title7', description: 'desc1', price: 23.33)
    accessory8 = Accessory.create!(title: 'title8', description: 'desc1', price: 23.33)
    accessory9 = Accessory.create!(title: 'title9', description: 'desc1', price: 23.33)
    accessory10 = Accessory.create!(title: 'title10', description: 'desc1', price: 23.33)
    accessory11 = Accessory.create!(title: 'title11', description: 'desc1', price: 23.33)
    @accessory12 = Accessory.create!(title: 'title12', description: 'desc1', price: 10.00)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit bike_shop_path

    within(".accessory-#{@accessory1.id}") do
      click_button "Add to Cart"
    end

    within(".accessory-#{@accessory12.id}") do
      click_button "Add to Cart"
    end

  end
  it 'see all bike accessories i have added to my cart' do
    visit cart_path

    expect(page).to have_content(@accessory12.title)
    expect(page).to have_content("$#{@accessory12.price}")
    expect(page).to have_content(@accessory1.title)
    expect(page).to have_content("$#{@accessory1.price}")
    expect(page).to have_xpath("//img[@src='#{@accessory12.image}']")
  end
end
