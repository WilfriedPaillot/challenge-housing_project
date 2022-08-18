require 'spec_helper'
require_relative '../lib/housing_project'

RSpec.describe HousingProject do
  let(:house) { House.new(length: 15, width: 12, floors: 2, price_m2: 15.50) }
  let(:project) { HousingProject.new(name: 'Test Project', interests: 10, delivery_time: Date.today + 365) }

  describe '#initialize' do
    it 'should initialize a HousingProject' do
      expect {housing_project}.not_to raise_error(ArgumentError, 'ArgumentError message')
    end
  end

  before(:each) do
    project.add_house(house)
  end

  describe '#add_house' do
    it 'should add a house to the project' do
      expect(project.houses.length).to eq 1
    end
  end

  describe '#delete_house' do
    it 'should delete a house from the project' do
      project.delete_house(house.id)
      expect(project.houses).to be_empty
    end
  end

  describe '#house_number' do
    it 'should return the number of houses in the project' do
      expect(project.house_number).to eq 1
    end
  end

  describe '#description' do
    it 'should return a description of the project' do
      expect(project.name).to eq 'Test Project'
      expect(project.interests).to eq 10
      expect(project.delivery_time).to eq Date.today + 365
      expect(project.houses.length).to eq 1
    end
  end

  describe '#project_surface' do
    it 'should return the surface area of the project' do
      expect(project.send(:project_surface)).to eq 360
    end 
  end
  
  describe '#project_costs' do
    it 'should return the costs of the project' do
      expect(project.send(:project_costs)).to eq 5580.0
    end
  end

  describe '#project_invest_return_price' do
    it 'should return the return on investment price of the project' do
      expect(project.send(:project_invest_return_price)).to eq 6138.0
    end
  end

  describe '#interest_percentage' do
    it 'should return the interest percentage of the project' do
      expect(project.send(:interest_percentage)).to eq 1.1
    end
  end
end
