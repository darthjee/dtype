require 'spec_helper'

RSpec.describe Utils::ErbBuilder do
  subject do
    described_class.new(template, variables)
  end
  let(:template) { 'The template "<%= name  %>"' }
  let(:variables) { { name: 'Templatux' } }

  context '#result' do
    it 'process the template' do
      expect(subject.result).to eq('The template "Templatux"')
    end

    context 'when two instance are run' do
      let(:variables) { { } }
      before do
        described_class.new(template, { name: 'Das Name' }).result
      end

      it 'do not interfer with each other' do
        expect { subject.result }.to raise_error(NameError)
      end
    end
  end
end
