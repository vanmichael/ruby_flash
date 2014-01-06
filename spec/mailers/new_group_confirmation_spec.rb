require "spec_helper"

describe NewGroupConfirmation do
  describe "notification" do
    let(:mail) { NewGroupConfirmation.notification }

    it "renders the headers" do
      mail.subject.should eq("Group Creation Confirmed")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end

    it 'sends a confirmation' do
      ActionMailer::Base.deliveries = []
      FactoryGirl.build(:group).add
      expect(ActionMailer::Base.deliveries.size).to eql(1)
    end

  end

end
