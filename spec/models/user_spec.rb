require 'spec_helper'

describe User do
  #Validations

  it { should have_valid(:first_name).when('Van') }
  it { should_not have_valid(:first_name).when(nil,'') }

  it { should have_valid(:last_name).when('Nguyen') }
  it { should_not have_valid(:last_name).when(nil,'') }

  it { should have_valid(:email).when('van@gmail.com') }
  it { should_not have_valid(:email).when(nil,'') }

  let(:blanks) { [nil, ''] }
  it { should have_valid(:email).when('van@gmail.com') }
  it { should_not have_valid(:email).when(*blanks) }

  let(:invalid_emails) { ['blah.com','@blah.com','@@blah.com','blah','.com'] }
  it { should_not have_valid(:email).when(*invalid_emails) }

  it "should have a unique email" do
	  user_one = FactoryGirl.build(:user)
	  user_two = FactoryGirl.build(:user)

	  expect(user_one.save).to eq true
	  expect(user_two.save).to eq false
  end

  #Associations

  it { should have_many :memberships }
end
