require 'rails_helper'

RSpec.describe Task, type: :model do
    let(:fixed_task){ FactoryBot.build(:fixed_task) }

    it "factoryでデータが作られること" do
        task_instance = Task.new(
                id: 2,
                name: "勉強",
                detail: "タスクの説明文ですテスト",
                deadline: '2020-04-04',
            )
        expect(fixed_task) .to eq task_instance
    end
end
