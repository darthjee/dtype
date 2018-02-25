require 'spec_helper'

describe Data::Transpose::Squared::Runner do
  let(:times) { 1 }
  let(:throws) { 3 }
  let(:total) { times * throws * segments }
  let(:source) { double(Data::Source, close: nil) }
  let(:output) { double(File, close: nil) }
  let(:output_values) { {} }
  subject do
    described_class.new(times, segments, source, output)
  end

  before do
    allow(source).to receive(:get) do
      experiments.shift
    end
    allow(output).to receive(:write) do |value|
      key, count = value.split("\t").map(&:to_f)
      output_values[key] = count
    end
  end

  describe '#run' do
    before do
      subject.run
    end

    context 'when there is one segment' do
      let(:segments) { 1 }

      context 'and it is perfectly fitted' do
        let(:experiments) { [0.5] }

        it 'returns the center of the graph' do
          expect(output_values).to eq(0.5 => 1)
        end
      end

      context 'and the result is not perfectly fitted' do
        context 'on the far right' do
          let(:experiments) { [1] }

          it 'returns the center of the graph' do
            expect(output_values).to eq(0.5 => 1)
          end
        end
      end
    end
  end
end
