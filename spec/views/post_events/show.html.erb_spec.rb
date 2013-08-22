require 'spec_helper'

describe "post_events/show" do
  before(:each) do
    @post_event = assign(:post_event, stub_model(PostEvent))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
