require 'spec_helper'

describe JewelSeed::MigrationProxy do
  describe 'initialize' do
    let(:file_name) { 'db/seed_migrate/20140514211500_init_user.rb' }
    let(:proxy) { JewelSeed::MigrationProxy.new(file_name) }

    it { expect(proxy.version).to eq 20140514211500 }
    it { expect(proxy.name).to eq 'InitUser' }
  end
end
