require 'spec_helper'

describe Group do

  #validations
  it { should have_valid(:name).when('algebra class') }
  it { should_not have_valid(:name).when(nil,'') }

  #associations
  it { should have_many :memberships }
  it { should have_many :users }

end
