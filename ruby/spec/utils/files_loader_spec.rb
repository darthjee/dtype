require 'spec_helper'

RSpec.describe Utils::FilesLoader do
  let(:file_path) { 'path/to/file' }
  subject do
    described_class.new(file_path)
  end

  describe '#to_s' do
    it 'joins the path with root' do
      expect(subject.to_s).to eq("/root/#{file_path}")
    end
  end
end
