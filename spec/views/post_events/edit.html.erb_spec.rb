require 'spec_helper'

describe "post_events/edit" do
  before(:each) do
    @post_event = assign(:post_event, stub_model(PostEvent))
  end

  it "renders the edit post_event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", post_event_path(@post_event), "post" do
    end
  end
end
