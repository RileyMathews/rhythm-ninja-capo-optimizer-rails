# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Song do
  let(:original_keys) { %w[A G].map { |v| Key.from_root v } }

  describe '#keys' do
    it 'holds a list of keys passed in' do
      actual = Song.new(keys: original_keys)

      expect(actual.keys[0].root).to eq('A')
      expect(actual.keys[1].root).to eq('G')
    end
  end

  describe '#transpose_down' do
    it 'returns a new song with all keys transposed up' do
      actual = Song.new(keys: original_keys).transpose_down(half_steps: 2)

      expect(actual.keys[0].root).to eq('G')
      expect(actual.keys[1].root).to eq('F')
    end
  end

  describe '#transpose_up' do
    it 'returns a new song with all keys transposed up' do
      actual = Song.new(keys: original_keys).transpose_up(half_steps: 2)

      expect(actual.keys[0].root).to eq('B')
      expect(actual.keys[1].root).to eq('A')
    end
  end
end
