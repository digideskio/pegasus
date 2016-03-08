require 'rails_helper'

RSpec.describe Account, type: :model do
  before :each do
    @account = FactoryGirl.create(:account)
  end

  subject { @account }

  it "#follow should follow an account" do
    other = FactoryGirl.create(:account)
    @account.follow other
    relation = Follow.find_by account: @account, destination: other, mode: Follow::FOLLOW_MODE_NORMAL

    expect(relation).not_to be_nil
  end

  it "#block should block an account" do
    other = FactoryGirl.create(:account)
    @account.block other
    relation = Follow.find_by account: @account, destination: other, mode: Follow::FOLLOW_MODE_BLOCK

    expect(relation).not_to be_nil
  end

  it "#unfollow should unfollow an account" do
    other = FactoryGirl.create(:account)
    @account.follow other
    @account.unfollow other
    relation = Follow.find_by account: @account, destination: other, mode: Follow::FOLLOW_MODE_NORMAL

    expect(relation).to be_nil
  end

  it "#unblock should unblock an account" do
    other = FactoryGirl.create(:account)
    @account.block other
    @account.unblock other
    relation = Follow.find_by account: @account, destination: other, mode: Follow::FOLLOW_MODE_BLOCK

    expect(relation).to be_nil
  end

  it "#follow should unblock and follow an account" do
    other = FactoryGirl.create(:account)
    @account.block other
    @account.follow other
    relation = Follow.find_by account: @account, destination: other, mode: Follow::FOLLOW_MODE_NORMAL

    expect(relation).not_to be_nil
  end

  it "#block should unfollow and block an account" do
    other = FactoryGirl.create(:account)
    @account.follow other
    @account.block other
    relation = Follow.find_by account: @account, destination: other, mode: Follow::FOLLOW_MODE_BLOCK

    expect(relation).not_to be_nil
  end

  it "#block_list should return a list" do
    other = FactoryGirl.create(:account)
    record = @account.block other
    blist = @account.block_list
    expect(blist.count).to be > 0
    expect(blist[0]).to eq record
  end

  it "#follow_list should return a list" do
    other = FactoryGirl.create(:account)
    record = @account.follow other
    flist = @account.follow_list
    expect(flist.count).to be > 0
    expect(flist[0]).to eq record
  end

  it "#pending_follower_list should return a list" do
    other = FactoryGirl.create(:account)
    @account.setting.private_account = true
    @account.setting.save!
    record = other.follow @account
    plist = @account.pending_follower_list
    expect(plist.count).to be > 0
    expect(plist[0]).to eq record
  end

  it "#follower_list should return a list" do
    other = FactoryGirl.create(:account)
    record = other.follow @account
    flist = @account.follower_list
    expect(flist.count).to be > 0
    expect(flist[0]).to eq record
  end

  it "#follow should not follow an account that blocked @account" do
    other = FactoryGirl.create(:account)
    other.block @account
    result = @account.follow other
    expect(result.errors.messages).not_to eq({})
  end

  it "#follow should follow an account that hasn't blocked @account" do
    other = FactoryGirl.create(:account)
    result = @account.follow other
    expect(result.errors.messages).to eq({})
  end
end
