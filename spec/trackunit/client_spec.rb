RSpec.describe TrackUnit::Client do

  let(:client_attrs) { TrackUnit::Client.new("ValidToken").class.default_options }
  let(:trackunit_uri) { "https://api.trackunit.com/public" }

  it "validates the addition of access token in TrackUnit client" do
    expect(client_attrs[:base_uri]).to eq(trackunit_uri)
    expect(client_attrs[:format]).to eq(:json)
    expect(client_attrs[:default_params][:token]).to eq("ValidToken")
  end
end