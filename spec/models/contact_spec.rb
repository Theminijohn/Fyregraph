require 'rails_helper'

describe Contact do

  # Factory
  it 'has a valid factory' do
    expect(build(:contact)).to be_valid
  end

  it 'is invalid without a firstname' do
    contact = build(:contact, first_name: nil)
    expect(contact).not_to be_valid
  end

  it 'is invalid without a lastname' do
    contact = build(:contact, last_name: nil)
    expect(contact).not_to be_valid
  end

  it 'is invalid without a mobile phone' do
    contact = build(:contact, mobile_phone: nil)
    expect(contact).not_to be_valid
  end

end
