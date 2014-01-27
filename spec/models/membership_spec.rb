require 'spec_helper'

describe Membership do

  it { should have_valid(:user_id).when(1) }

  it { should have_valid(:group_id).when(1) }

  it { should belong_to :user }
  it { should belong_to :group }

end
