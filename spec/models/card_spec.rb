require 'spec_helper'

describe Card do

  it { should have_valid(:title).when('Permutation') }
  it { should_not have_valid(:title).when(nil,'') }

  it { should have_valid(:question).when('Permutation Question') }
  it { should_not have_valid(:question).when(nil,'') }

  it { should have_valid(:answer).when('Answer to permutation question') }
  it { should_not have_valid(:answer).when(nil,'') }

  it { should have_valid(:group_id).when(1) }
  it { should_not have_valid(:group_id).when(nil,'') }

  it { should belong_to :group }
  it { should have_many :topics }

end
