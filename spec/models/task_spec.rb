require 'rails_helper'

RSpec.describe Task, type: :model do
    let(:task){ FactoryBot.build(:task) }

    it "factoryでデータが作られること" do
        task_instance = Task.new(
                name: "hoge",
                detail: "foobarcontents",
            )
        expect(task) .to eq　task_instance
    end
end
