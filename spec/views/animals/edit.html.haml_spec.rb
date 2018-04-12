# require 'rails_helper'
#
# RSpec.describe "animals/edit", type: :view do
#   before(:each) do
#     @animal = assign(:animal, Animal.create!(
#       :name => "MyString",
#       :user => nil,
#       :species => "MyString"
#     ))
#   end
#
#   it "renders the edit animal form" do
#     render
#
#     assert_select "form[action=?][method=?]", animal_path(@animal), "post" do
#
#       assert_select "input[name=?]", "animal[name]"
#
#       assert_select "input[name=?]", "animal[user_id]"
#
#       assert_select "input[name=?]", "animal[species]"
#     end
#   end
# end
