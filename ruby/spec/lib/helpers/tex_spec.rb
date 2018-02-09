require 'spec_helper'

RSpec.describe Helpers::Tex do
  subject do
    Utils::Template.new(input, output, variables, helpers)
  end

  let(:helpers) { [ described_class ] }
  let(:input) { Utils::FilesLoader.file 'fixtures/templates/tex_sample.erb' }
  let(:variables) { {} }
  let(:output) { Utils::FilesLoader.file 'output/tex_sample.tex' }
  let(:output_file) { File.open(output, 'r') }
  let(:output_text) { output_file.read }

  describe '#format_tex_number' do
    it 'convert the number to tex' do
      subject.build
      expect(output_text).to include('format_tex_number: $12345.6$')
    end
  end
end
