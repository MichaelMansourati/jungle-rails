require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'electricbobbo', email: 'electric@bib.com', password: 'samepass', password_confirmation: 'samepass') }

  describe 'Validations' do

    it 'is valid' do
      expect(subject).to be_valid
    end

    it 'is invalid without a name' do
      subject.name = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to eq ["Name can't be blank"]
    end

    it 'is invalid without an email address' do
      subject.email = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to eq ["Email can't be blank"]
    end

    it 'is invalid if email is not unique' do
      other_user = User.create(name: 'fire Janet', email: 'Janet@fire.com', password: 'otherpass', password_confirmation: 'otherpass')
      subject.email = other_user.email
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to eq ["Email has already been taken"]
    end

    it 'is invalid without a password' do
      subject.password = nil
      subject.password_confirmation = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to eq ["Password can't be blank"]
    end

    it 'is invalid if password does not match confirmation' do
      subject.password_confirmation = 'differentpass'
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to eq ["Password confirmation doesn't match Password", "Password confirmation doesn't match Password"]
    end

    it 'is invalid if password is less than six characters' do
      subject.password = 'short'
      subject.password_confirmation = 'short'
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to eq ["Password is too short (minimum is 6 characters)"]
    end

  end


  # describe '.authenticate_with_credentials' do
  #   another_person = User.create(name: 'waterjohnny', email: 'water@john.com', password: 'thispass', password_confirmation: 'thispass')

  #   it 'is valid' do
  #     expect(User.authenticate_with_credentials('water@john.com', 'samepass')).not_to be_nil
  #   end
  #   #i need to be able to truncate/destroy all created users
  # end

end

