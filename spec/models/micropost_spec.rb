require 'spec_helper'

describe Micropost do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @micropost = user.microposts.build(content: "Lorem ipsum")
  end

  subject { @micropost }

  it { should respond_to(:content)}
  it { should respond_to(:user_id)}
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @micropost.user_id = nil }
  	it { should_not be_valid }
  end

  describe "with blank content" do
    before { @micropost.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @micropost.content = "a" * 141 }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
  	it "should not allow access to user_id" do
  	  expect do 
  	  	Micropost.new(user_id: user.id)
  	  end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end

  # describe "micropost associations" do
  # 	before { @user.save}
  # 	let!(:older_micropost) do
  # 	  FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
  # 	end
  # 	let!(:newer_micropost) do
  # 	  FactoryGirl.create(:micropost, user: @user, created_at: 1.hour.ago)
  # 	end
  	
  # 	it "should have the right microposts in the right order" do
  # 	  @user.microposts.should == [newer_micropost, older_micropost]
  # 	end


  # end

end
