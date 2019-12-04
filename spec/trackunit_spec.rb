RSpec.describe TrackUnit do
  it "has a version number" do
    expect(TrackUnit::VERSION).not_to be nil
  end

  context "generates an error when Units are fetched" do
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
end
