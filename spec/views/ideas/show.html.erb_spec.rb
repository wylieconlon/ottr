require 'spec_helper'

describe "ideas/show.html.erb" do
  before(:each) do
    @idea = assign(:idea, stub_model(Idea,
      :what => "What",
      :where => "Where",
      :when => "When",
      :who => "Who"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/What/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Where/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/When/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Who/)
  end
end
