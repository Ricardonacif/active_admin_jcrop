require 'spec_helper'

feature 'Post admin' do

  describe 'Croping modal', js: true do
    
    subject { page }

    background do
      @post = FactoryGirl.create(:post)
      visit "/admin/posts/#{@post.id}/edit"
    end

  end
end