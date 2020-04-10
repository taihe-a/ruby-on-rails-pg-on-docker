require 'rails_helper'

RSpec.describe Task, type: :model do
  
  describe 'validation' do
    let(:task) { FactoryBot.create(:task) }

    describe 'valid' do
      it '有効なデータであること' do
        expect(task).to be_valid
      end
    end

    describe 'invalid' do
      it 'nameバリデーション' do
        task.name = ''
        expect(task).to be_invalid
      end
    
      it 'detailが10文字以下の場合' do 
        task.detail = 'アイウエオ'
        expect(task).to be_invalid
      end
    end
  end

  describe 'search' do
    let(:task1) { FactoryBot.create(:task, name: 'トレーニング1') }
    let(:task2) { FactoryBot.create(:task, name: 'トレーニング2' , progress: 1, priority:1) }
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
        let(:name) { 'トレーニング1' }
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
        it 'return task2' do
          expect(Task.search(params)).to include(task2)
        end
      end
    end
  end
end
