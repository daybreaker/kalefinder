require 'spec_helper'

describe "places/new" do
  before(:each) do
    assign(:place, stub_model(Place,
      :lat => "",
      :long => "",
      :short_name => "",
      :address => "",
      :categories => ""
    ).as_new_record)
  end

  it "renders new place form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", places_path, "post" do
      assert_select "input#place_lat[name=?]", "place[lat]"
      assert_select "input#place_long[name=?]", "place[long]"
      assert_select "input#place_short_name[name=?]", "place[short_name]"
      assert_select "input#place_address[name=?]", "place[address]"
      assert_select "input#place_categories[name=?]", "place[categories]"
    end
  end
end
