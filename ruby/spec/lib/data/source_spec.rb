require 'spec_helper'

describe Data::Source do
  let(:source) { Utils::FilesLoader.file 'output/source.random' }
  let(:random_values) { (1..49).map { |i| i / 100.0 } }
  subject do
    described_class.new(source)
  end
  let(:random_times) { Time.now.to_i % 5 + 1 }
  let(:expected_generated_array) do
    (1..random_times).map { |i| i / 100.0 }
  end
  let(:expected_generated) do
    expected_generated_array.join("\n") + "\n"
  end

  before do
    allow(Random).to receive(:rand) { random_values.shift }
  end
  after do
    subject.close
  end

  describe '#get' do
    context 'when file is empty' do
      before do
        File.open(source, 'w').close
      end

      it 'writes the random values to file' do
        expect do
          random_times.times { subject.get }
          subject.close
        end.to change { File.open(source, 'r').read }.to(expected_generated)
      end

      it 'returns the randomly generated numbers' do
        expect(random_times.times.map { subject.get }).to eq(expected_generated_array)
      end

      context 'after generating once' do
        before do
          allow(Random).to receive(:rand) { (Time.now.to_f * 10000) % 1 }
        end
        let!(:first_run) do
          random_times.times.map { subject.get }.tap do
            subject.close
          end
        end

        it 'returns the same values as the first run' do
          expect(random_times.times.map { subject.get }).to eq(first_run)
        end

        it 'does not change the file' do
          expect do
            random_times.times { subject.get }
            subject.close
          end.not_to change { File.open(source, 'r').read }
        end
      end
    end

    context 'when the file already has values' do
      let(:expected_stored) do
        (1..random_times).map { |i| (i + 50) / 100.0 }.join("\n") + "\n"
      end
      before do
        File.open(source, 'w').tap do |file|
          file.write(expected_stored)
          file.close
        end
      end

      context 'when reading less values than exist in the file' do
        it 'does not change the source file' do
          expect do
            random_times.times { subject.get }
            subject.close
          end.not_to change { File.open(source, 'r').read }
        end
      end

      context 'when reading more values that are already stored' do
        it 'changes the source file' do
          expect do
            (2*random_times).times { subject.get }
            subject.close
          end.to change { File.open(source, 'r').read }.to(expected_stored + expected_generated)
        end
      end
    end

    context 'when file does not exist' do
      before do
        File.delete(source)
      end

      it 'creates file' do
        expect do
          subject.get
          subject.close
        end.to change { File.exist?(source) }.to(true)
      end

      it 'writes the random values to file' do
        random_times.times { subject.get }
        subject.close
        expect(File.open(source, 'r').read).to eq(expected_generated)
      end
    end
  end
end
