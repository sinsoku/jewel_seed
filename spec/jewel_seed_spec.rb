require 'spec_helper'

describe JewelSeed do
  it 'should have a version number' do
    JewelSeed::VERSION.should_not be_nil
  end
end
