require 'spec_helper'

describe Data::Transpose::Binomial::Experiment do
  let(:source) { double(Data::Source) }
  subject do
    described_class.new(source, random_list.size)
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
  end
end
