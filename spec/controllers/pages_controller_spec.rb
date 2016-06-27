require 'rails_helper'
require 'capybara/rspec'

RSpec.describe PagesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  describe "home page links", :type => :feature do

  end
end
