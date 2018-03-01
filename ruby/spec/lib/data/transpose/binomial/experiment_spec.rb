require 'spec_helper'

describe Data::Transpose::Binomial::Experiment do
  let(:source) { double(Data::Source) }
  let(:times) { random_list.size }
  let(:random_list) do
    Array.new(Random.rand * 20 + 10) { Random.rand }
  end

  subject do
    described_class.new(source, times)
  end
  before do
    allow(source).to receive(:get) { random_list.shift }
  end

  describe '#success_rate' do
    context 'when everything is a success' do
      let(:random_list) { [1, 0.5] }

      it { expect(subject.success_rate).to eq(1) }
    end

    context 'when everything is a failure' do
      let(:random_list) { [0, 0.4] }

      it { expect(subject.success_rate).to eq(0) }
    end

    context 'when half is failure and half is success' do
      let(:random_list) { [0, 1] }

      it { expect(subject.success_rate).to eq(0.5) }
    end

    context 'when calling it twice' do
      it 'caches the result' do
        expect(subject.success_rate).to eq(subject.success_rate)
      end
    end
  end

  describe '#reset' do
    let(:times) { random_list.size / 2 }

    context 'after running it once' do
      it do
        expect do
          subject.reset
        end.to change(subject, :success_rate)
      end
    end
  end
end
