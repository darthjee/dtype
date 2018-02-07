require 'spec_helper'

RSpec.describe Utils::FilesLoader do
  let(:file_path) { 'path/to/file' }
  subject do
    described_class.new(file_path)
  end

  describe 'path fetching' do
    it 'fetches path from config and joins with root' do
      expect(described_class.data.random_source).to eq('/root/data/transpose/random.dat')
    end
  end
end
