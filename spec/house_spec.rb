require 'spec_helper'
require_relative '../lib/house'

RSpec.describe House do
  let(:house) { House.new(length: 10, width: 12, floors: 2, price_m2: 15.50) }

  describe '#instancatiate' do
    it 'should instanciate a new House' do
      expect(house).to be_a House
    end
  end

  describe '#uuid' do
    it 'should return a UUID' do
      expect(house.id).to be_a String
      expect(house.id.length).to eq 36
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
      expect(house.price_m2).to be_a Float
      expect(house.price_m2).to eq 15.50
    end
  end

  describe '#perimeter' do
    it 'should return the perimeter of the house' do
      expect(house.perimeter).to be_a Integer
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
      expect(house.identity_card).to eq({
        length: "This house has a 10 meters length",
        width: "This house has a 12 meters width",
        floors: "This house has 2 floors",
        created_at: "This house was created Saturday, the 09 of July, 2022",
      })
    end

    describe '#price' do
      it 'should return the price of the house' do
        expect(house.price).to eq 240 * 15.50
        expect(house.display_price).to eq "#{240 * 15.50} $"
      end
    end
  end

end
