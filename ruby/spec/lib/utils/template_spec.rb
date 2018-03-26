require 'spec_helper'

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
end
