require 'spec_helper'

feature 'Post admin' do
  include ActiveAdmin::SignInHelper

  background do
    admin_user = FactoryGirl.create(:admin_user)
    sign_in_with(admin_user.email, admin_user.password)
  end

  describe 'Crop modal elements on edit page' do
    before do
      @post = FactoryGirl.create(:post)
      visit "/admin/posts/#{@post.id}/edit"
    end # before

    it "should have a div image hidden on the form" do 
      binding.pry
    end
  end

end # feature

