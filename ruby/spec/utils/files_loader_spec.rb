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

  describe 'path fetching' do
    it 'fetches path from config and joins with root' do
      expect(described_class.data.random_source.to_s).to eq('/root/data/transpose/random.dat')
    end
  end
end
