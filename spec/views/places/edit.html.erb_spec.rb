require 'spec_helper'

describe "places/edit" do
  before(:each) do
    @place = assign(:place, stub_model(Place,
      :lat => "",
      :long => "",
      :short_name => "",
      :address => "",
      :categories => ""
    ))
  end

  it "renders the edit place form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", place_path(@place), "post" do
      assert_select "input#place_lat[name=?]", "place[lat]"
      assert_select "input#place_long[name=?]", "place[long]"
      assert_select "input#place_short_name[name=?]", "place[short_name]"
      assert_select "input#place_address[name=?]", "place[address]"
      assert_select "input#place_categories[name=?]", "place[categories]"
    end
  end
end
