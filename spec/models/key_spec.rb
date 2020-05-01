# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Key do
  describe '.from_root' do
    context 'when you pass in a valid root' do
      it 'returns a key' do
        actual = Key.from_root 'G'

        expect(actual.root).to eq 'G'
        expect(actual.chromatic_index).to eq 10
      end
    end

    context 'when you pass in an invalid root' do
      it 'raises an invalid argument error' do
        expect { Key.from_root 'V' }
          .to raise_error ArgumentError, 'V is not a valid key'
      end
    end
  end

  describe '.from_chromatic_index' do
    context 'when given a valid chromatic index' do
      it 'returns a key' do
        actual = Key.from_chromatic_index 10

        expect(actual.root).to eq 'G'
        expect(actual.chromatic_index).to eq 10
      end
    end

    context 'when given an invalid index' do
      it 'raises an argument error' do
        expect { Key.from_chromatic_index 13 }
          .to raise_error ArgumentError, '13 is not a valid index'
      end
    end
  end

  describe '#caged_key?' do
    context 'when the key is a caged key' do
      it 'returns true' do
        Key::CAGED_KEYS.each do |root|
          expect(Key.from_root(root).caged_key?).to eq true
        end
      end
    end

    context 'when the key is not a caged key' do
      it 'returns false' do
        non_caged_keys = Key::INDEX_TO_ROOT.filter { |_k, v| !Key::CAGED_KEYS.include?(v) }.map { |_k, v| v }
        non_caged_keys.each do |root|
          expect(Key.from_root(root).caged_key?).to eq false
        end
      end
    end
  end

  describe '#transpose_up' do
    it 'transposes the key up by the number of steps' do
      actual = Key.from_root('G').transpose_up(half_steps: 1)

      expect(actual.root).to eq('G#')
    end
  end

  describe '#transpose_down' do
    it 'transposes the key down by the number of steps' do
      actual = Key.from_root('G').transpose_down(half_steps: 1)

      expect(actual.root).to eq('F#')
    end
  end
end
