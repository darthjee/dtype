require 'spec_helper'

describe Data::Transpose::Binomial::Runner do
  let(:times) { 1 }
  let(:throws) { double }
  let(:total) { times * throws * segments }
  let(:source) { double(Data::Source, close: nil) }
  let(:output) { double(File, close: nil) }
  subject do
    described_class.new(times, segments, throws, source, output)
  end
  before do
    allow_any_instance_of(Data::Transpose::Binomial::Experiment).to receive(:success_rate) do
      experiments.shift
    end
    allow(output).to receive(:write) do |value|
      key, count = value.split("\t").map(&:to_f)
      output_values[key] = count
    end
  end
  let(:output_values) { {} }

  describe '#run' do
    before do
      subject.run
    end

    context 'when there is one segment' do
      let(:segments) { 1 }

      context 'and its perfectly fitted' do
        let(:experiments) { [0.5] }

        it 'returns the center of graph' do
          expect(output_values).to eq(0.5 => 1)
        end
      end

      context 'when the result is not perfectly fit to the center' do
        context 'on the far right' do
          let(:experiments) { [1] }

          it 'returns the center of graph' do
            expect(output_values).to eq(0.5 => 1)
          end
        end
        context 'on the far left' do
          let(:experiments) { [0] }

          it 'returns the center of graph' do
            expect(output_values).to eq(0.5 => 1)
          end
        end
      end
    end

    context 'when there are 2 segments' do
      let(:segments) { 2 }
      context 'and there are several rolls' do
        let(:times) { 3 }
        let(:experiments) { [0, 0.25, 0.3, 0.5, 0.75, 1] }

        it 'returns the calculated graph' do
          expect(output_values).to eq(
            0.25 => 1,
            0.75 => 1
          )
        end
      end
    end

    context 'when there are several segmenst' do
      let(:segments) { (Random.rand * 10).to_i + 2 }
      let(:times) { ((Random.rand * 10).to_i + 2) * segments }
      let(:experiments) { Array.new(segments * times) { Random.rand } }

      it 'integrates to 1' do
        expect(output_values.values.sum).to eq(segments)
      end

      it 'creates the expected lanes' do
        expect((2 * output_values.keys.sum).round).to eq(segments)
      end

      it 'creates the expected lanes' do
        expect(output_values.keys).to eq(Array.new(segments) { |i| (2 * i + 1) / (2.0 * segments) })
      end
    end
  end
end
