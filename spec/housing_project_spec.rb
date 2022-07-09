require 'spec_helper'
require_relative '../lib/housing_project'

RSpec.describe HousingProject do
  let(:house) { House.new(length: 15, width: 12, floors: 2, price_m2: 15.50) }
  let(:project) { HousingProject.new(name: 'Test Project', interests: 10, delivery_time: Date.today + 365) }

  describe '#initialize' do
    it 'should initialize a HousingProject' do
      expect(project).to be_a HousingProject
    end
  end

  describe '#add_house' do
    it 'should add a house to the project' do
      project.add_house(house)
      expect(project.houses).to eq [house]
    end
  end

  describe '#delete_house' do
    it 'should delete a house from the project' do
      project.add_house(house)
      project.delete_house(house.id)
      expect(project.houses).to eq []
    end
  end

  describe '#house_number' do
    it 'should return the number of houses in the project' do
      project.add_house(house)
      expect(project.house_number).to eq 1
    end
  end

  describe '#description' do
    it 'should return a description of the project' do
      project.add_house(house)
      expect(project.description).to eq({
        name: "This Housing Project is called Test Project",
        house_count: "This Project contains 1 houses",
        costs: "The Project is valued at 5580.0 $",
        selling_value: "We wish to sell the project for 6138.0 $",
        roi: "The return on investment is 10 %",
        delivery_time: "#{(Date.today + 365).strftime('%A, the %d of %B, %Y')}",
        area: "360 m2 of housing"
      })
    end
  end

  describe '#project_surface' do
    it 'should return the surface area of the project' do
      project.add_house(house)
      expect(project.send(:project_surface)).to eq 360
    end
  end

  describe '#project_costs' do
    it 'should return the costs of the project' do
      project.add_house(house)
      expect(project.send(:project_costs)).to eq 5580.0
    end
  end

  describe '#project_invest_return_price' do
    it 'should return the return on investment price of the project' do
      project.add_house(house)
      expect(project.send(:project_invest_return_price)).to eq 6138.0
    end
  end

  describe '#interest_percentage' do
    it 'should return the interest percentage of the project' do
      project.add_house(house)
      expect(project.send(:interest_percentage)).to eq 1.1
    end
  end
end
