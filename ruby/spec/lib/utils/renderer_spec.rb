require 'spec_helper'

module Utils::Renderer::DummyHelper
end

class Utils::Renderer::Dummy < Utils::Renderer
  self.helpers << Utils::Renderer::DummyHelper
end

RSpec.describe Utils::Renderer do
  subject do
    described_class.new(input, output, variables, helpers)
  end

  let(:helpers) { [ Helpers::SpecHelper ] }
  let(:input) { Utils::FilesLoader.file 'fixtures/templates/sample.erb' }
  let(:variables) { { name: 'roger' } }
  let(:output) { Utils::FilesLoader.file 'output/sample' }
  let(:output_file) { File.open(output, 'r') }
  let(:output_text) { output_file.read }

  describe '#build' do
    it 'proccess the template file' do
      subject.build
      expect(output_text).to eq("This is a template: Roger\n")
    end
  end

  describe '.helpers' do
    it 'isolates subclasses helpers' do
      expect(described_class::Dummy.helpers).to include(described_class::DummyHelper)
      expect(described_class.helpers).not_to include(described_class::DummyHelper)
    end
  end
end
