require 'spec_helper'

describe Data::Transpose::Runner do
  let(:times) { 1 }
  let(:total) { times * throws * segments }
  let(:segments) { 3 }
  let(:throws) { 10  }
  let(:source) { Data::Source.new(Utils::FilesLoader.file('fixtures/data/source.dat')) }
  let(:output) { double(File, close: nil) }
  subject do
    described_class.new(times, segments, experiment, output)
  end
  before do
    allow(output).to receive(:write) do |value|
      key, count = value.split("\t").map(&:to_f)
      output_values[key] = count
    end
  end
  let(:output_values) { {} }

  describe '#run' do
    context 'when having a simple experiment' do
      let(:experiment) do
        double(Data::Transpose::Binomial::Experiment, reset: nil, source: source)
      end
      before do
        allow(experiment).to receive(:success_rate) do
          experiments.shift
        end
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
    end

    context 'when there are several segments' do
      let(:times) { 10 }
      let(:experiment) do
        Data::Transpose::Binomial::Experiment.new(source, throws)
      end
      before do
        subject.run
      end

      it 'integrates to 1' do
        expect(output_values.values.sum.round).to eq(segments)
      end

      it 'creates the expected lanes' do
        expect(output_values.keys).to eq(Array.new(segments) { |i| (2 * i + 1) / (2.0 * segments) })
      end
    end
  end
end
