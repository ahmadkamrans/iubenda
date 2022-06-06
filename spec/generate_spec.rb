require_relative '../lib/generate'
require_relative '../lib/template'
require_relative '../lib/dataset'

require 'json'

describe Generate do
  context 'when template file is not passed or it does not exist.' do
    let(:message) { 'Please, provide a valid path of the template file!!!' }

    it 'throws an error' do
      expect { described_class.new.process }.to raise_error(RuntimeError, message)
      expect { described_class.new('non-existent-file.txt').process }.to raise_error(RuntimeError, message)
    end
  end

  context 'when dataset file is not passed or it does not exist.' do
    let(:message) { 'Please, provide a valid path of the dataset file!!!' }

    it 'throws an error' do
      expect { described_class.new('template_file.txt').process }.to raise_error(RuntimeError, message)
      expect { described_class.new('template_file.txt', 'non-existent-file.json').process }.to raise_error(RuntimeError, message)
    end
  end

  context 'when files are passed as arguments and they exists' do
    it 'displays appropriate information' do
      message = <<~TC
        A T&C Document

        This document is made of plaintext.

        Is made of And dies.
        Is made of The white horse is white.
        Is made of The quick brown fox;jumps over the lazy dog.

        Your legals.
      TC
      expect { described_class.new('template_file.txt', 'dataset_file.json').process }.to output(message).to_stdout
    end
  end
end
