require 'spec_helper'

feature 'Post admin' do

  describe 'Croping modal', js: true do
    
    subject { page }

    background do
      @post = FactoryGirl.create(:post)
      visit "/admin/posts/#{@post.id}/edit"
    end

    it "should have a button to open crop modal" do 
#      binding.pry
      button = page.find('.crop_modal_open')
      expect(button).to be_present
      page.find('.crop_modal_open').should be_present
    end

  end
end