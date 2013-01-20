require 'spec_helper'
describe Event do
  it { should have_valid(:name).when('Team Building trip', 'Community Service')}
  it { should_not have_valid(:name).when('""', 'qw%$%ftrt')}
  it { should_not have_valid(:description).when('""', '111','#####asdfg', ' ')}
  it { should have_valid(:description).when('team building trip is always fun', 'community service description')}
  it { should have_valid(:start_at).when(2012-01-06,2012-1-07)}
  it { should have_valid(:end_at).when(2012-02-06,2012-2-06)}
  it { should_not have_valid(:start_at).when("a","4")}
  it { should have_valid(:start_at).when(2012/1/23)}
end