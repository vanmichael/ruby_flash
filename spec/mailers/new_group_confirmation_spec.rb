require "spec_helper"

describe NewGroupConfirmation do
  describe "notification" do
    
    it 'sends a confirmation' do
      ActionMailer::Base.deliveries = []
      FactoryGirl.build(:group).add
      expect(ActionMailer::Base.deliveries.size).to eql(1)
    end

  end

end
