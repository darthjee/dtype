require 'spec_helper'

describe Helpers::Renderer do
  subject do
    Utils::Template.new(input, variables, helpers)
  end

  let(:helpers) { [ described_class ] }
  let(:input) { Utils::FilesLoader.file 'fixtures/templates/renderer_sample.erb' }
  let(:variables) { {} }
  let(:expected_file) { Utils::FilesLoader.file 'fixtures/templates/renderer_sample.txt' }
  let(:expected) { File.open(expected_file, 'r').read }

  describe 'render' do
    it 'renders another inner template' do
      expect(subject.to_s).to eq(expected)
    end
  end
end
