require 'spec_helper'

describe Membership do
  #Validations
  it { should have_valid(:user_id).when(1) }
  it { should_not have_valid(:user_id).when(nil,'') }

  it { should have_valid(:group_id).when(1) }
  it { should_not have_valid(:group_id).when(nil,'') }

  #associations

  it { should belong_to :user }
  it { should belong_to :group }
end
