require 'spec_helper'

RSpec.describe Utils::Loader do
  subject do
    described_class.new(arguments)
  end
  let(:arguments) { %w(data transpose binomial experiment) }

  describe '#constantize' do
    context 'when creating from array' do
      it 'returns the expected class' do
        expect(subject.constantize).to eq(Data::Transpose::Binomial::Experiment)
      end
    end

    context 'when creating from string' do
      let(:arguments) { 'data/transpose/binomial/experiment' }

      it 'returns the expected class' do
        expect(subject.constantize).to eq(Data::Transpose::Binomial::Experiment)
      end
    end
  end
end
