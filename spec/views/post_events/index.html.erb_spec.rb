require 'spec_helper'

describe "post_events/index" do
  before(:each) do
    assign(:post_events, [
      stub_model(PostEvent),
      stub_model(PostEvent)
    ])
  end

  it "renders a list of post_events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
