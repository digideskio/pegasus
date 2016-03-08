require 'rails_helper'

RSpec.describe Account, type: :model do
  before :each do
    @account_a = FactoryGirl.create(:account)
    @account_b = FactoryGirl.create(:account)
  end

  subject { @account_a }
  subject { @account_b }

  it "#create should automatically unblock when following" do
    Follow.create(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_BLOCK)
    Follow.create(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_NORMAL)

    result = Follow.find_by(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_BLOCK)
    expect(result).to be_nil

    result = Follow.find_by(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_NORMAL)
    expect(result).not_to be_nil
  end

  it "#create should automatically unfollow when blocking" do
    Follow.create(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_NORMAL)
    Follow.create(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_BLOCK)

    result = Follow.find_by(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_NORMAL)
    expect(result).to be_nil

    result = Follow.find_by(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_BLOCK)
    expect(result).not_to be_nil
  end

  it "#create should automatically set a follow as pending when following a private account" do
    @account_b.setting.private_account = true
    @account_b.setting.save

    Follow.create(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_NORMAL)

    result = Follow.find_by(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_NORMAL)
    expect(result).to be_nil

    result = Follow.find_by(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_PENDING)
    expect(result).not_to be_nil
  end

  it "#accept should change the record's mode to FOLLOW_MODE_NORMAL" do
    @account_b.setting.private_account = true
    @account_b.setting.save

    Follow.create(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_NORMAL)

    result = Follow.find_by(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_PENDING)
    expect(result).not_to be_nil

    result.accept

    result = Follow.find_by(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_PENDING)
    expect(result).to be_nil

    result = Follow.find_by(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_NORMAL)
    expect(result).not_to be_nil
  end

  it "#reject should delete the record" do
    @account_b.setting.private_account = true
    @account_b.setting.save

    Follow.create(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_NORMAL)

    result = Follow.find_by(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_PENDING)
    expect(result).not_to be_nil

    result.reject

    result = Follow.find_by(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_PENDING)
    expect(result).to be_nil

    result = Follow.find_by(account: @account_a, destination: @account_b, mode: Follow::FOLLOW_MODE_NORMAL)
    expect(result).to be_nil
  end
end
