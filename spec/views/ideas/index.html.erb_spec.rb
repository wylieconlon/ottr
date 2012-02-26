require 'spec_helper'

describe "ideas/index.html.erb" do
  before(:each) do
    assign(:ideas, [
      stub_model(Idea,
        :what => "What",
        :where => "Where",
        :when => "When",
        :who => "Who"
      ),
      stub_model(Idea,
        :what => "What",
        :where => "Where",
        :when => "When",
        :who => "Who"
      )
    ])
  end

  it "renders a list of ideas" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "What".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Where".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "When".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Who".to_s, :count => 2
  end
end
