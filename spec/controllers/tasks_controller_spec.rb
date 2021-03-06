# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :request do
  before do
    FactoryBot.create(:user) do |user|
      FactoryBot.create_list(:task, 2, user: user)
    end
  end

  describe 'GET #index' do
    context 'when params_direction is DESC' do
      it 'データが降順で返されること' do
        get tasks_url, params: { direction: 'DESC' }
        expect(Task.order(deadline: 'DESC').map(&:id)).to eq [2, 1]
      end
    end

    context 'when params_direction is other than DESC' do
      it 'データが昇順で返されること' do
        get tasks_url, params: { direction: 'ASC' }
        expect(Task.order(deadline: 'ASC').map(&:id)).to eq [3, 4]
      end
    end
  end
end
