require 'spec_helper'

RSpec.shared_examples 'a class loader' do |method|
  context 'when creating from array' do
    it 'returns the expected class' do
      expect(subject.public_send(method)).to eq(Data::Transpose::Binomial::Experiment)
    end
  end

  context 'when creating from string' do
    let(:arguments) { 'data/transpose/binomial/experiment' }

    it 'returns the expected class' do
      expect(subject.public_send(method)).to eq(Data::Transpose::Binomial::Experiment)
    end
  end
end

RSpec.describe Utils::Loader do
  subject do
    described_class.new(arguments)
  end
  let(:arguments) { %w(data transpose binomial experiment) }

  describe '#constantize' do
    it_behaves_like 'a class loader', :constantize do
      context 'when class do not exist' do
        let(:arguments) { 'data/transposeee' }

        it do
          expect(subject.constantize).to be_nil
        end
      end
    end
  end

  describe '#constantize!' do
    it_behaves_like 'a class loader', :constantize! do
      context 'when class do not exist' do
        let(:arguments) { 'data/transposeee' }

        it do
          expect do
            subject.constantize!
          end.to raise_error(NameError)
        end
      end
    end
  end
end
