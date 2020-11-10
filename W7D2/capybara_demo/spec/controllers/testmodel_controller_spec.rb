require "rails_helper"

RSpec.describe TestmodelController, type: :controller do
  describe "GET #index" do
    it "renders the index page" do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "renders the show page" do
      ClassName.create!(key: value)
      get :show, id: 1
      expect(response).to render_template(:show)
    end
    context "if the inst does not exist" do
      it "is not a success" do
        begin
          get :show, id: -1
        rescue
          ActiveRecord::RecordNotFound
        end
        expect(response).not_to render_template(:show)
      end
    end
  end

  describe "POST #create" do
    context "with invalide params" do
      it "renders the new page" do
        post :create, inst: { key: value }
        expect(response).to render_template(:new)
      end
    end

    context "with valid params" do
      it "redirect to the index page" do
        post :create, inst: { validkey: validvalue }
        expect(response).to redirect_to(inst_url(ClassName.find_by(validkey: validvalue)))
      end
    end
  end
end
