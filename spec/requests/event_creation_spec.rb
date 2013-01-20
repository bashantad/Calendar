require 'spec_helper'
describe Event do
  it "should create a Event with valid data" do
    user = Factory(:user)
    #Event = Factory(:event, :name =>"My first event")
    login(user)
    visit new_event_path
    fill_in "name", :with => "My event first" 
    fill_in "description", :with => "My event first" 
    fill_in "start_at", :with => 2012-01-06
    fill_in "end_at", :with => 2012-01-06 
    click_button "Add event"
  end
end