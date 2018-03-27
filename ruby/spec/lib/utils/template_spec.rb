require 'spec_helper'

module Utils::Template::DummyHelper
end

class Utils::Template::Dummy < Utils::Template
  self.helpers << Utils::Template::DummyHelper
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
  end

  describe '.helpers' do
    it 'isolates subclasses helpers' do
      expect(described_class::Dummy.helpers).to include(described_class::DummyHelper)
      expect(described_class.helpers).not_to include(described_class::DummyHelper)
    end
  end
end
