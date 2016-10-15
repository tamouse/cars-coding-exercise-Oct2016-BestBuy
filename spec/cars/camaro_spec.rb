require "spec_helper"

module Cars

  RSpec.describe Camaro do

    let(:reporter) { double('output') }
    subject { described_class.new(reporter: reporter) }

    it "has a maximum current_speed of 200" do
      expect(subject.max_velocity).to eq(200)
    end

    it "has model name 'Camaro'" do
      expect(subject.model).to eq('Camaro')
    end

    it "has brand name 'Chevy'" do
      expect(subject.brand).to eq('Chevy')
    end

    it "accelerates to 200 and then stops" do
      expect(subject).to receive(:accelerate).exactly(200).times.and_call_original
      expect(subject).to receive(:stop).once.and_call_original
      expect(reporter).to receive(:print).exactly(200).times
      expect(reporter).to receive(:puts).with('Car Chevy Camaro reached maximum current_speed of 200')
      subject.drive
      expect(subject.current_speed).to eq(0)
    end

  end
end
