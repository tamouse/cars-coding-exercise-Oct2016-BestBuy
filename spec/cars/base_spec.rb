require "spec_helper"

module Cars

  RSpec.describe Base do

    let(:reporter) { double('output') }
    subject { described_class.new(reporter: reporter) }

    it "has unknown brand" do
      expect(subject.brand).to eq('unknown')
    end

    it "has maximum velocity of zero" do
      expect(subject.max_velocity).to eq(0)
    end

    it "accelerate increases velocity by one" do
      expect(subject.velocity).to eq(0)
      expect(reporter).to receive(:print).with('.')
      subject.accelerate
      expect(subject.velocity).to eq(1)
    end

    it "stop sets velocity to zero" do
      subject.velocity = 27
      subject.stop
      expect(subject.velocity).to eq(0)
    end

    it "drive calls accelerate until velocity reaches maximum then calls stop" do
      subject.max_velocity = 2
      expect(subject).to receive(:accelerate).twice.and_call_original
      expect(subject).to receive(:stop).once.and_call_original
      expect(reporter).to receive(:print).twice
      expect(reporter).to receive(:puts).once
      subject.drive
      expect(subject.velocity).to eq(0)
    end


  end

end
