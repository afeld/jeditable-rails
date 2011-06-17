require 'spec_helper'

describe JeditableHelper do
  Dummy::Application.routes.draw do
    resources :gadgets
  end
  
  describe "editable_field" do
    it "should display the value of the object" do
      gadget = mock_model('Gadget', :id => 1, :name => "First")
      helper.editable_field(gadget, :name).should =~ /First/
    end
  end
end
