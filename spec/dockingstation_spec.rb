require 'docking_station'

describe DockingStation do
  bike = Bike.new

  it { is_expected.to respond_to(:bikes)}

  it 'returns docked bike' do
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  describe '#release_bike' do
    it 'raises error when no bike' do
      expect {subject.release_bike}.to raise_error "no bike"
    end
    it 'releases working bikes' do
      subject.dock(bike)
      subject.release_bike
      expect(bike.working?).to be true
    end
  end

  describe '#dock' do
    it 'dock bike' do
      expect(subject.dock(bike)).to eq [bike]
    end
    it 'raises error when capacity full' do
      DockingStation::DEFAULT_CAPACITY.times{subject.dock(bike)}
      expect {subject.dock(bike)}.to raise_error "no capacity"
    end
  end
end
