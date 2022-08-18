require 'spec_helper'
require_relative '../lib/house'

RSpec.describe House do
  let(:house) { House.new(length: 10, width: 12, floors: 2, price_m2: 15.50) }

  describe '#instancatiate' do
    it 'should instanciate a new House' do
      expect {house}.not_to raise_error(ArgumentError, 'ArgumentError message from Rspec')
    end
  end

  describe '#uuid' do
    it 'should return a UUID' do
      expect(house.id).not_to be_nil
    end
  end

  describe '#length' do
    it 'should return the length of the house' do
      expect(house.length).to eq 10
    end
  end
  
  describe '#width' do
    it 'should return the width of the house' do
      expect(house.width).to eq 12
    end
  end
  
  describe '#floors' do
    it 'should return the floors of the house' do
      expect(house.floors).to eq 2
    end
  end

  describe '#price_m2' do
    it 'should return the price per square meter' do
      expect(house.price_m2).to eq 15.50
    end
  end

  describe '#perimeter' do
    it 'should return the perimeter of the house' do
      expect(house.perimeter).to eq 44
    end
  end
  
  describe '#surface_area' do
    it 'should return the surface area of the house' do
      expect(house.surface_area).to eq 240
    end
  end

  describe '#identity_card' do
    it 'should return the identity card of the house' do
      expect(house.identity_card).to be_a Hash
    end

    describe '#price' do
      it 'should return the price of the house' do
        expect(house.price).to eq 3720.0
        expect(house.display_price).to eq '3720.0 $'
      end
    end
  end

end
