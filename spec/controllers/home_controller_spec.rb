# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController do
  render_views

  describe 'GET /' do
    it 'renders the form' do
      get :get

      expect(response.body).to include('optimize')
      %w[A A# B C C# D D# E F F# G G#].each do |key|
        expect(response.body).to include(key)
      end
    end
  end

  describe 'GET /optimize' do
    it 'renders transposition information' do
      get :optimize, 'A#' => '1'

      expect(response.body).to include('capo position: 1', 'A# becomes A')
    end
  end
end
