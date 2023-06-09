require 'rails_helper'

 RSpec.describe 'User Model Functions', type: :model do
   describe 'Validation test' do
    before do
      @user = FactoryBot.create(:user)
    end

     context 'If the user\'s name is an empty string' do
       it 'Validation fails' do
        @user.name = ''
        expect(@user).not_to be_valid
       end
     end

     context 'If the user\'s email address is an empty string' do
       it 'Validation fails' do
        @user.email = ''
        expect(@user).not_to be_valid
       end
     end

     context 'If the user\'s password is an empty string' do
       it 'Validation fails' do
        @user.password = ''
        @user.password_confirmation = ''
        expect(@user).not_to be_valid
       end
     end

     context 'If the user\'s email address is already in use' do
       it 'Validation fails' do
        user2 = FactoryBot.build(:user, email: @user.email)
        expect(user2).not_to be_valid
       end
     end

     context 'If the user\'s password is less than 6 characters' do
       it 'Validation fails' do
        @user.password = '12456'
        expect(@user).not_to be_valid
       end
     end

     context 'If the user\'s name has a value, the email address is an unused value, and the password is at least 6 characters long' do
       it 'Validation Succeeds in' do
        user5 = FactoryBot.build(:user)
        expect(@user).to be_valid
       end
     end
   end
 end