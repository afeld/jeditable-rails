require 'spec_helper'

describe JeditableHelper do
  describe "editable_field" do
    it "should display the value of the object" do
      gadget = Gadget.new(:name => 'First')
      helper.editable_field(gadget, :name).should =~ /First/
    end
  end
end
