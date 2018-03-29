require 'spec_helper'

class Utils::Template
  module DummyHelper
  end

  module DummyHelper2
  end

  class Dummy < self
    self.helpers << DummyHelper
    helper DummyHelper2
  end
end

RSpec.describe Utils::Template do
  subject do
    described_class.new(input, variables, helpers)
  end

  let(:helpers) { [ Helpers::SpecHelper ] }
  let(:input) { Utils::FilesLoader.file 'fixtures/templates/sample.erb' }
  let(:variables) { { name: 'roger' } }

  describe '#to_s' do
    it 'proccess the template file' do
      expect(subject.to_s).to eq("This is a template: Roger\n")
    end

    context 'when adding helpers' do
      let(:input) { Utils::FilesLoader.file 'fixtures/templates/renderer_sample.erb' }
      it 'does not remove the class helpers' do
        expect do
          subject.to_s
        end.not_to raise_error
      end
    end
  end

  describe '.helpers' do
    it 'isolates subclasses helpers' do
      expect(described_class::Dummy.helpers).to include(described_class::DummyHelper)
      expect(described_class.helpers).not_to include(described_class::DummyHelper)
    end
  end

  describe '.helper' do
    it 'adds a helper' do
      expect(described_class::Dummy.helpers).to include(described_class::DummyHelper2)
    end
  end
end
