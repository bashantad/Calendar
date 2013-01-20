require 'spec_helper'
describe Circle do
  it "should create a circle with valid data" do
    user = Factory(:user)
    circle = Factory(:circle, :name =>"Training",:user_ids =>user.id)
    login(user)
    visit new_circle_path
    fill_in "Name", :with => "Hari Bahadur"
    check("check_member_1")
    click_button "Create Circle"
    page.should have_content("Circle was successfully created.")
  end
end