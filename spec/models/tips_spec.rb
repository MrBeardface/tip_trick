require 'spec_helper'

describe Tips do

  let(:user) { FactoryGirl.create(:user) }
  before { @tips = user.tips.build(content: "Lorem ipsum") }
  

  subject { @tips }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { shoulbe be_valid}

   describe "when user_id is not present" do
    before { @mtips.user_id = nil }
    it { should_not be_valid }
  end
	
	describe "with blank content" do
    before { @micropost.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @micropost.content = "a" * 501 }
    it { should_not be_valid }
  end
end
