require 'spec_helper'
describe Circle do
  it { should have_valid(:name).when('Training', 'Sproutian')}
  it { should_not have_valid(:name).when('""', 'qw%$%ftrt')}
  it { should_not have_valid(:user_ids).when(' ')}
end
