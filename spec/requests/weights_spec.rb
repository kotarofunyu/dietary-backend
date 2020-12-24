require 'rails_helper'

RSpec.describe "WeightController" do
  describe 'GET /weights' do
    context 'with params[:user_id]' do
      it 'returns ok' do
        user = create(:user)
        create(:weight, user_id: user.id)

        get '/weights', params: { user_id: user.id }
        expect(response).to have_http_status(:ok)
      end

      it 'returns weight data index' do
        user = create(:user)
        weight = create(:weight, user_id: user.id)

        get '/weights', params: { user_id: user.id }

        json_response = JSON.parse(response.body)

        expect(json_response.first['id']).to eq weight.id
        expect(json_response.first['date']).to eq weight.date.to_s
        expect(json_response.first['weight']).to eq weight.weight
        expect(json_response.first['comment']).to eq weight.comment
      end
    end

    context 'without params[:user_id]' do
      it 'returns not found' do
        get '/weights'
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
