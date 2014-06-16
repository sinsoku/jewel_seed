require 'spec_helper'

describe JewelSeed::MigrationProxy do
  describe 'initialize' do
    let(:file_name) { 'db/seed_migrate/20140514211500_init_user.rb' }
    subject { JewelSeed::MigrationProxy.new(file_name) }

    its(:version) { should eq 20140514211500 }
    its(:name) { should eq 'InitUser' }
  end
end
