require "spec_helper"

module Cars

  RSpec.describe Base do

    let(:reporter) { double('output') }
    subject { described_class.new(reporter: reporter) }

    it "has unknown brand" do
      expect(subject.brand).to eq('unknown')
    end

    it "has maximum current_speed of zero" do
      expect(subject.max_velocity).to eq(0)
    end

    it "accelerate increases current_speed by one" do
      expect(subject.current_speed).to eq(0)
      expect(reporter).to receive(:print).with('.')
      subject.accelerate
      expect(subject.current_speed).to eq(1)
    end

    it "stop sets current_speed to zero" do
      subject.current_speed = 27
      subject.stop
      expect(subject.current_speed).to eq(0)
    end

    it "drive calls accelerate until current_speed reaches maximum then calls stop" do
      subject.max_velocity = 2
      expect(subject).to receive(:accelerate).twice.and_call_original
      expect(subject).to receive(:stop).once.and_call_original
      expect(reporter).to receive(:print).twice
      expect(reporter).to receive(:puts).once
      subject.drive
      expect(subject.current_speed).to eq(0)
    end


  end

end
