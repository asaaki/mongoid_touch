# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class TestDocOne
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Document::Touch
  field :name, type: String
end

class TestDocTwo
  include Mongoid::Document
  include Mongoid::Document::Touch
  field :name, type: String
  field :modified_at, type: Time
end

describe Mongoid::Document::Touch do

  describe ".touch" do

    it "updates the updated_at field" do
      doc = TestDocOne.create(name: "My test doc")
      origin_at = doc.updated_at
      sleep 1.1
      doc.touch.should be_true
      doc.updated_at.should > origin_at
    end

    it "updates a custom Time field" do
      doc = TestDocTwo.create(name: "My test doc", modified_at: Time.now.utc)
      origin_at = doc.modified_at
      sleep 1.1
      doc.touch(:modified_at).should be_true
      doc.modified_at.should > origin_at  
    end

  end

  describe ".touch!" do

    it "returns true if :touch is successful on a timestamp" do
      doc = TestDocOne.create(name: "My test doc")
      doc.touch!.should be_true
    end

    it "raises an error if :touch failed on frozen object" do
      doc = TestDocOne.create(name: "My test doc")
      doc.freeze
      lambda { doc.touch! }.should raise_error(Mongoid::Errors::FrozenInstance)
    end

    it "returns true if :touch! is successful on a custom time field" do
      doc = TestDocTwo.create(name: "My test doc", modified_at: Time.now.utc)
      doc.touch!(:modified_at).should be_true
    end

    it "raises an error if :touch! failed on frozen object" do
      doc = TestDocTwo.create(name: "My test doc", modified_at: Time.now.utc)
      doc.freeze
      lambda { doc.touch!(:modified_at) }.should raise_error(Mongoid::Errors::FrozenInstance)
    end

    it "raises a MissingField error if :touch! tries to modify a non-existing field" do
      doc = TestDocTwo.create(name: "My test doc", modified_at: Time.now.utc)
      lambda { doc.touch!(:undefined_at) }.should raise_error(Mongoid::Errors::MissingField)
    end

    # force this special fail with the optional param "force_fail = true" in #touch! method
    it "raises a DocumentNotUpdated error if :touch! can't update." do
      doc = TestDocOne.create(name: "My test doc")
      lambda { doc.touch!(:undefined_at,true) }.should raise_error(Mongoid::Errors::DocumentNotUpdated)
    end

  end

end

