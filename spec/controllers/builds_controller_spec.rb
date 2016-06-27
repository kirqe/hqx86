require 'rails_helper'

RSpec.describe BuildsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:build) { FactoryGirl.create(:build) }

  # index
  describe "GET #index" do
    before :each do
      sign_in user
      get :index
    end

    it "renders index template" do
      expect(response).to render_template(:index)
    end

    it "assigns @builds to template" do
      expect(assigns(:builds)).to match_array([build])
    end
  end

  # show
  describe "GET #show" do
    it "should render show template" do
      get :show, id: build
      expect(response).to render_template(:show)
    end

    it "should assign build item to template" do
      get :show, id: build
      expect(assigns(:build)).to eq(build)
    end
  end

  # new
  describe "GET #new" do
    context "user authorised" do
      it "should render new template" do
        sign_in user
        get :new
        expect(response).to render_template(:new)
      end
    end

    context "user unauthorised" do
      it "should redirect user to sign up page" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end


end
