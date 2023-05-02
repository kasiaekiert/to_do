require 'pry'
require './task'

RSpec.describe Task, type: :model do
  subject { described_class.new(name) }

  context "with present name" do
    let(:name) { "newtask" }

    it "exists a name" do
      expect(subject.name).to eq("newtask")
    end
  
    it "is undone be default" do
      expect(subject.done).to eq(false)
    end
  end

  context "with empty name" do
    let(:name) { nil }

    it "gives proper error message" do
      expect { subject }.to raise_error(Task::MissingName, "Name should be present")
    end
  end
end
