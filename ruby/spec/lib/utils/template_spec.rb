require 'spec_helper'

RSpec.describe Utils::Template do
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
end
