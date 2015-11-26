require 'bike'

describe Bike do
  it { is_expected.to respond_to :working?}


  it 'should be working' do
    subject.working?
    expect(subject.working?).to eq true
  end

it 'can be reported broken' do
    subject.report_broken
    expect(subject).to be_broken
  end


   #it 'able to dock bikes' do
    #  expect(subject).to respond_to :dock
    #end

end