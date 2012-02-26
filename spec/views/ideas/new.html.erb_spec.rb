require 'spec_helper'

describe "ideas/new.html.erb" do
  before(:each) do
    assign(:idea, stub_model(Idea,
      :what => "MyString",
      :where => "MyString",
      :when => "MyString",
      :who => "MyString"
    ).as_new_record)
  end

  it "renders new idea form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => ideas_path, :method => "post" do
      assert_select "input#idea_what", :name => "idea[what]"
      assert_select "input#idea_where", :name => "idea[where]"
      assert_select "input#idea_when", :name => "idea[when]"
      assert_select "input#idea_who", :name => "idea[who]"
    end
  end
end
