require 'spec_helper'

feature 'Post admin' do

  describe 'Crop modal elements on edit page' do
    background do
      @post = FactoryGirl.create(:post)
      visit "/admin/posts/#{@post.id}/edit"
    end

    it "should have a div image hidden on the form" do 
      binding.pry
    end
  end

end