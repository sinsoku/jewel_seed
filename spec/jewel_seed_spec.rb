require 'spec_helper'

describe JewelSeed do
  it { expect(JewelSeed::VERSION).to_not be_nil }

  describe '.seed_tables' do
    before do
      allow(JewelSeed::SeedMigrationTable).to receive(:table_names)
      JewelSeed.seed_tables
    end
    it { expect(JewelSeed::SeedMigrationTable).to have_received(:table_names) }
  end
end
