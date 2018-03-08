require 'spec_helper'

RSpec.describe Helpers::Gnuplot do
  subject do
    Class.new() do
      include Helpers::Gnuplot
    end.new
  end

  describe '#range' do
    context 'when range is well defined' do
      it 'generates a range' do
        expect(subject.range([1,10])).to eq('[1:10]')
      end
    end
    context 'when range has no left limit' do
      it 'generates a range' do
        expect(subject.range([nil,10])).to eq('[*:10]')
      end
    end
    context 'when range has no right limit' do
      it 'generates a range' do
        expect(subject.range([1,nil])).to eq('[1:*]')
      end
    end
    context 'when range has no limits' do
      it 'generates a range' do
        expect(subject.range([nil, nil])).to eq('[*:*]')
      end
    end
    context 'when one range is missing' do
      it 'completes with no limit' do
        expect(subject.range([1,nil])).to eq('[1:*]')
      end
    end
    context 'missing all range' do
      it 'completes with no limit' do
        expect(subject.range([])).to eq('[*:*]')
      end
    end
    context 'passing nil' do
      it 'completes with no limit' do
        expect(subject.range(nil)).to eq('[*:*]')
      end
    end
  end

  describe '#plot_line' do
    context 'when plot is a data source' do
      let(:plot) { ::Gnuplot::Plot::Data.new(attributes) }
      let(:with) { nil }
      let(:attributes) do
        {
          input: 'input.dat',
          title: 'The Data',
          x_column: 3,
          with: with
        }
      end
      it 'plots the data' do
        expect(subject.plot_line(plot)).to eq("'input.dat' using ($3):($2) t 'The Data'")
      end

      context 'and passing the plotting type' do
        let(:with) { :boxes }
        it 'plots the data' do
          expect(subject.plot_line(plot)).to eq("'input.dat' using ($3):($2) t 'The Data' w boxes")
        end
      end
    end

    context 'when passing a function' do
      xit 'write function plot scenario'
    end
  end
end
