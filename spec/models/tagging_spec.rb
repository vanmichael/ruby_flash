require 'spec_helper'

describe Tagging do

  it { should belong_to :card }
  it { should belong_to :topic }

end
