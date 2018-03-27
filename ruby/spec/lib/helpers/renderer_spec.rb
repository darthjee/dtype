require 'spec_helper'

describe Helpers::Renderer do
  subject do
    Utils::Template.new(input, variables)
  end

  let(:input) { Utils::FilesLoader.file 'fixtures/templates/renderer_sample.erb' }
  let(:variables) { { name: :test } }
  let(:expected_file) { Utils::FilesLoader.file 'fixtures/templates/renderer_sample.txt' }
  let(:expected) { File.open(expected_file, 'r').read }

  describe 'render' do
    it 'renders another inner template' do
      expect(subject.to_s).to eq(expected)
    end
  end
end
