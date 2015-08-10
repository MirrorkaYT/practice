require 'spec_helper.rb'

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  describe 'validations' do
  it { should validate_presence_of(:nickname).on(:create) }
  it { should validate_length_of(:nickname).on(:create) }
  it { should validate_presence_of(:email).on(:create) }
  it { should validate_uniqueness_of(:email).on(:create) }
  it { should validate_presence_of(:password).on(:create) }
  it { should validate_length_of(:password).on(:create) }
  end

  describe 'associations' do
    it { should have_many(:articles) }
  end
end
