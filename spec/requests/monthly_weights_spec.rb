require 'rails_helper'

RSpec.describe "MonthlyWeightController" do
  describe 'GET /monthly' do
    context 'with params[:user_id] and params[:month]' do
      it 'returns monthly weights' do
        user = create(:user)
        weight = create(:weight, user_id: user.id, date: '2020-01-01')

        get '/monthly', params: { month: 1, user_id: user.id }

        json_response = JSON.parse(response.body)

        expect(json_response.first['id']).to eq weight.id
        expect(json_response.first['date']).to eq weight.date.to_s
        expect(json_response.first['weight']).to eq weight.weight
        expect(json_response.first['comment']).to eq weight.comment
      end
    end

    context 'without params' do
      it 'returns not found' do
        get '/monthly'
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
