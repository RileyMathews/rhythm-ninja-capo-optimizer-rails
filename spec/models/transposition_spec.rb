# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transposition do
  describe '#key_mappings' do
    it 'returns a mppings of old keys to new' do
      original_keys = %w[G A].map { |v| Key.from_root v }
      song = Song.new(keys: original_keys)

      actual = Transposition.new(original_song: song, steps_down: 2).key_mappings

      expect(actual.first[:original_key]).to eq('G')
      expect(actual.first[:new_key]).to eq('F')
    end
  end
end
