require 'rails_helper'

RSpec.describe Task, type: :model do
    let(:task){ FactoryBot.build(:task) }} 

    it "" do
        @task_instance = Task.new(
                name: "hoge",
                detail: "foobarcontents",
            )
        byebug
        expect(task) == @task_instance
    end
end
