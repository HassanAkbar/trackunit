RSpec.describe TrackUnit::Client::Units do
  context "generates an TrackUnit::AuthorizationError when Units are fetched" do
    before(:each) do
      stub_request(:get, "https://api.trackunit.com/public/unit?token=InvalidToken").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Ruby'
        }).
      to_return(status: 401, body: "", headers: {})
    end

    it "throws an error for a wrong Trackunit account" do
      client = TrackUnit::Client.new("InvalidToken")
      expect { client.units }.to raise_error(TrackUnit::AuthorizationError)
    end

    it "throws an error for a wrong Trackunit account" do
      client = TrackUnit::Client.new("InvalidToken")
      expect { client.units }.to raise_error(TrackUnit::AuthorizationError)
    end
  end

  context "generates a successful response when Units are fetched" do
    let(:success_body_response) { File.open(File.expand_path("../../support/fixtures/units.json", __FILE__)).read }
    before(:each) do
      stub_request(:get, "https://api.trackunit.com/public/unit?token=ValidToken").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Ruby'
        }).
      to_return(
        status: 200,
        body: success_body_response,
        headers: {}
      )
    end

    it "validates the serial number response of units" do
      units = TrackUnit::Client.new("ValidToken").units
      expect(units.count).to eq(10)
      expect(units[0].serial_number).to eq("223120")
      expect(units[1].serial_number).to eq("223123")
      expect(units[2].serial_number).to eq("234536")
      expect(units[3].serial_number).to eq("234567")
      expect(units[4].serial_number).to eq("234568")
      expect(units[5].serial_number).to eq("234569")
      expect(units[6].serial_number).to eq("239598")
      expect(units[7].serial_number).to eq("235024")
      expect(units[8].serial_number).to eq("241968")
      expect(units[9].serial_number).to eq("241959")
    end
  end
end