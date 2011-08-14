# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class TestDoc
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
end

class TestDocTwo
  include Mongoid::Document
  field :name, type: String
  field :modified_at, type: Time
end

describe "Mongoid::Document#touch" do

  it "should update the updated_at field" do
    doc = TestDoc.create(name: "My test doc")
    origin_at = doc.updated_at
    sleep 1
    doc.touch
    doc.updated_at.should > origin_at
  end
  
  it "should update a custom Time field" do
    doc = TestDocTwo.create(name: "My test doc", modified_at: Time.now.utc)
    origin_at = doc.modified_at
    sleep 1
    doc.touch(:modified_at)
    doc.modified_at.should > origin_at  
  end

end
