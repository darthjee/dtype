require 'spec_helper'

describe Data::Transpose::Binomial::Result do
  let(:file) { File.open(file_path, 'r') }
  let(:file_path) do
    Utils::FilesLoader.file 'fixtures/data/binomial.dat'
  end

  subject do
    described_class.new(file)
  end

  describe '#average' do
    it 'calculates the weighted average' do
      expect(subject.average).to eq(0.5102050000000001)
    end
  end
end
