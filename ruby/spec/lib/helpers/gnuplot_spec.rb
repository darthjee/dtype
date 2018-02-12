require 'spec_helper'

RSpec.describe Helpers::Gnuplot do
  subject do
    Utils::Template.new(input, output, variables, helpers)
  end

  let(:helpers) { [ described_class ] }
  let(:input) { Utils::FilesLoader.file 'fixtures/templates/gnuplot_sample.erb' }
  let(:variables) { {} }
  let(:output) { Utils::FilesLoader.file 'output/gnuplot_sample.gnu' }
  let(:output_file) { File.open(output, 'r') }
  let(:output_text) { output_file.read }

  before do
    subject.build
  end

  describe '#range' do
    context 'when range is well defined' do
      it 'generates a range' do
        expect(output_text).to include('defined range: [1:10]')
      end
    end
    context 'when range has no left limit' do
      it 'generates a range' do
        expect(output_text).to include('no left range: [*:10]')
      end
    end
    context 'when range has no right limit' do
      it 'generates a range' do
        expect(output_text).to include('no right range: [1:*]')
      end
    end
    context 'when range has no limits' do
      it 'generates a range' do
        expect(output_text).to include('no limits range: [*:*]')
      end
    end
    context 'when one range is missing' do
      it 'completes with no limit' do
        expect(output_text).to include('missing range: [1:*]')
      end
    end
    context 'missing all range' do
      it 'completes with no limit' do
        expect(output_text).to include('missing all range: [*:*]')
      end
    end
    context 'passing nil' do
      it 'completes with no limit' do
        expect(output_text).to include('nil range: [*:*]')
      end
    end
  end
end
