# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transposition do
  describe '#new_song' do
    it 'returns the new song with the transposition value applied' do
      original_keys = %w[G A].map { |v| Key.from_root v }
      song = Song.new(keys: original_keys)

      actual = Transposition.new(original_song: song, steps_down: 2)

      expect(actual.new_song.keys[0].root).to eq('F')
      expect(actual.new_song.keys[1].root).to eq('G')
    end
  end
end
