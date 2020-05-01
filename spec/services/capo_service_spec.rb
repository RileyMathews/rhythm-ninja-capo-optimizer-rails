# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CapoService do
  describe '#optimize' do
    it 'returns a list of optimized capo positions for a given song' do
      song = Song.new(keys: [Key.from_root('G#')])

      actual = CapoService.new(original_song: song).optimize

      expect(actual[0].new_song.keys[0].root).to eq('G')
      expect(actual[0].steps_down).to eq(1)
    end

    it 'optimizes a list of multiple keys' do
      song = Song.new(keys: [Key.from_root('G#'), Key.from_root('A#')])

      actual = CapoService.new(original_song: song).optimize

      expect(actual[0].new_song.keys[0].root).to eq('G')
      expect(actual[0].new_song.keys[1].root).to eq('A')
      expect(actual[0].steps_down).to eq(1)
    end

    it 'optimizes with a priority given to CAGED keys' do
      song = Song.new(keys: [Key.from_root('B'), Key.from_root('D')])

      actual = CapoService.new(original_song: song).optimize

      expect(actual[0].new_song.keys[0].root).to eq('A')
      expect(actual[0].new_song.keys[1].root).to eq('C')
      expect(actual[0].steps_down).to eq(2)
    end
  end
end
