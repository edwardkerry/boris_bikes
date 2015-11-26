require "docking_station.rb"

describe DockingStation do

let(:bike) {double("bike")}

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it 'docks something' do
    bikes = double(:bike)
    expect(subject.dock(bikes)).to eq [bikes]
  end

  it 'returns docked bikes' do
    bikes = double(:bike)
    subject.dock(bikes)
    expect(subject.bikes).to eq [bikes]
  end

  it { is_expected.to respond_to :release_bike }


  it 'releases working bikes' do
    subject.dock double(:bike, broken?: false, working?: true)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = double(:bike, broken?: false, working?: true)
      subject.dock bike
      expect(subject.release_bike).to eq bike
    end
  end



  describe '#broken?' do
    it'does not release if bike is broken' do
      bikes = double(:bike)
      allow(bikes).to receive(:broken?).and_return(true)
      subject.dock(bikes)
      expect { subject.release_bike }.to raise_error 'The bike is broken'
    end
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error when the station is full' do
      subject.capacity.times { subject.dock double(:bike) }
      expect { subject.dock double(:bike) }.to raise_error 'Station is full'
    end

 #   it 'reports a bike as broken if working? = false'
  #    bikes = Bike.new
   #   bikes.working? == false
    #  subject.dock(bikes)
     # expect(subject.dock bikes).to eq broken?

  end

  describe '#capacity' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { double(:bike) }
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