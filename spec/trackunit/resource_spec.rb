require "trackunit/resource"

RSpec.describe TrackUnit::Resource do
  let(:success_body_response) { File.open(File.expand_path("../support/fixtures/units.json", __FILE__)).read } 
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

  it "serializes response from API" do
    units = TrackUnit::Client.new("ValidToken").units
    response = TrackUnit::Client.get('/unit')
    serialized_response = subject.class.serialize_response(response)
    expect(units).to eq(serialized_response)
  end
end