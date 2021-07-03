require 'rails_helper'

RSpec.describe Cat, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      cat = Cat.new(api_id: 'A123', url: 'https://example.com').save
      expect(cat).to eq(false)
    end
  end
end
