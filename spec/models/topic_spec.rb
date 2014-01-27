require 'spec_helper'

describe Topic do

  it { should have_valid(:name).when('enumerables') }
  it { should_not have_valid(:name).when(nil,'') }

  it "should have a unique topic" do
  	topic_one = FactoryGirl.build(:topic)
  	topic_two = FactoryGirl.build(:topic)

  	expect(topic_one.save).to eq true
  	expect(topic_two.save).to eq false
  end

  it { should have_many :cards }
  it { should have_many :taggings }

end
