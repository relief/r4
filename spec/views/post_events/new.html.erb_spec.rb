require 'spec_helper'

describe "post_events/new" do
  before(:each) do
    assign(:post_event, stub_model(PostEvent).as_new_record)
  end

  it "renders new post_event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", post_events_path, "post" do
    end
  end
end
