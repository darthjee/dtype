require 'spec_helper'

describe Data::Transpose::Squared::Experiment do
  let(:source) { double(Data::Source) }
  let(:random_list) { 2.times.map { |i| 0.5 * (i + Random.rand)} }

  subject do
    described_class.new(source)
  end
  before do
    allow(source).to receive(:get) do
      random_list.shift
    end
  end

  describe '#success_rate' do
    context 'when calling' do
      let(:random_value) { Random.rand }
      before do
        allow(source).to receive(:get) { random_value }
      end
      it 'proxy request to source' do
        expect(subject.success_rate).to eq(random_value)
      end
    end

    context 'when calling it twice' do
      it 'caches the result' do
        expect(subject.success_rate).to eq(subject.success_rate)
      end
    end
  end

  describe '#reset' do
    it do
      expect do
        subject.reset
      end.to change(subject, :success_rate)
    end
  end
end
