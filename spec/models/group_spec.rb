require 'spec_helper'

describe Group do

  it { should have_valid(:name).when('algebra class') }
  it { should_not have_valid(:name).when(nil,'') }

  it { should have_many :memberships }
  it { should have_many :users }

end
