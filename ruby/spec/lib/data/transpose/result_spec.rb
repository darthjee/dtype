require 'spec_helper'

describe Data::Transpose::Result do
  let(:file) { File.open(file_path, 'r') }
  let(:fixture_name) { 'binomial.dat' }
  let(:file_path) do
    Utils::FilesLoader.file "fixtures/data/#{fixture_name}"
  end

  subject do
    described_class.new(file)
  end

  describe '#average' do
    it 'calculates the weighted average' do
      expect(subject.average).to eq(0.5102050000000001)
    end

    context 'when we have a perfect gaussian' do
      let(:fixture_name) { 'binomial_simple.dat' }

      it 'calculates the weighted average' do
        expect(subject.average).to eq(2)
      end
    end
  end

  describe '#variance' do
    it 'calculates the variance' do
      expect(subject.variance).to eq(0.010802497975000002)
    end

    context 'when we have a simetrical gaussian data' do
      let(:fixture_name) { 'binomial_simple.dat' }

      it 'calculates the variance' do
        expect(subject.variance).to eq(0.5)
      end
    end
  end

  describe '#gaussian' do
    it do
      expect(subject.gaussian).to be_a(Function::Gauss)
    end
  end
end
