require "rails_helper"

RSpec.describe TasksController, type: :controller do
  describe "POST #create" do
    context "with valid params" do
      let(:params) do
        {
          task: {
            task: "Hello",
            completed: true
          }
        }
      end

      it "creates a task" do
        expect {
          post :create, params: params
        }.to change(Task, :count).by(1)
      end

      it "returns a success response" do
        post :create, params: params

        expect(response).to have_http_status(:created)

        body = JSON.parse(response.body)
        expect(body["success"]).to eq(true)
      end
    end

    context "with invalid params" do
      let(:params) do
        {
          task: {
            task: "Hello"
          }
        }
      end

      it "does not create a task" do
        expect {
          post :create, params: params
        }.not_to change(Post, :count)
      end

      it "returns validation errors" do
        post :create, params: params

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
