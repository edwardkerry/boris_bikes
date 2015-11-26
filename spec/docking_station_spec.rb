require "docking_station.rb"

describe DockingStation do

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it 'docks something' do
    bikes = Bike.new
    expect(subject.dock(bikes)).to eq [bikes]
  end

  it 'returns docked bikes' do
    bikes = Bike.new
    subject.dock(bikes)
    expect(subject.bikes).to eq [bikes]
  end

  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
      bikes = Bike.new
      expect(bikes).to be_working
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bikes = Bike.new
      subject.dock(bikes)
      expect(subject.release_bike).to eq bikes
    end
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error when the station is full' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Station is full'
    end
  end

  describe '#capacity' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Station is full'
    end
  end
end



# describe DockingStation do
#   it 'responds to release_bike' do
#     expect(subject).to respond_to :release_bike
#   end
# end