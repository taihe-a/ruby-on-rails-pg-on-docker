require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    FactoryBot.create(:user1)
    FactoryBot.create(:user2)
  end
  
  describe 'validation' do
    let(:fixed_task) { FactoryBot.create(:fixed_task) }

    describe 'valid' do
      it '有効なデータであること' do
        expect(fixed_task).to be_valid
      end
    end

    describe 'invalid' do
      it 'nameが空の場合' do
        fixed_task.name = ''
        expect(fixed_task).to be_invalid
      end

      it 'detailが10文字以下の場合' do
        fixed_task.detail = 'アイウエオ'
        expect(fixed_task).to be_invalid
      end
    end
  end

  describe 'search' do
    let(:task1) { FactoryBot.create(:task1) }
    let(:task2) { FactoryBot.create(:task2) }
    let(:params) { { 'name' => name, 'progress' => progress } }
    context 'when params is nil' do
      context 'nilで検索した場合全てのデータを返す' do
        it 'return task1' do
          expect(Task.search(nil)).to include(task1, task2)
        end
      end
    end
  end

  describe 'search' do
    let(:task1) { FactoryBot.create(:task1) }
    let(:task2) { FactoryBot.create(:task2) }
    let(:params) { { 'name' => name, 'progress' => progress, 'priority' => priority } }

    context 'when params is nil' do
      context 'nilで検索した場合全てのデータを返す' do
        it 'return task1' do
          expect(Task.search(nil)).to include(task1, task2)
        end
      end
    end

    context 'when params exist' do
      context 'トレーニングで検索して該当の値を返す' do
        let(:name) { 'トレーニング' }
        let(:progress) { '' }
        let(:priority) { '' }
        it 'return task1' do
          expect(Task.search(params)).to include(task1)
        end
      end

      context '未着手で検索して値を返す' do
        let(:name) { '' }
        let(:progress) { 'WORKING' }
        let(:priority) { '' }
        it 'return task2' do
          expect(Task.search(params)).to include(task2)
        end
      end

      context '優先度HIGHで検索して値を返す' do
        let(:name) { '' }
        let(:progress) { '' }
        let(:priority) { 'HIGH' }
        it 'return task1' do
          expect(Task.search(params)).to include(task1)
        end
      end
    end
  end
end
