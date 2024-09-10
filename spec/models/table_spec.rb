# == Schema Information
#
# Table name: tables
#
#  id         :bigint           not null, primary key
#  available  :boolean          default(TRUE)
#  capacity   :integer
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Table, type: :model do
  context 'Associations' do
    it "has associations" do
      should have_many(:reservation_tables)
      should have_many(:reservations).through(:reservation_tables)
    end
  end

  context 'Validations' do
    it "has validations" do
      should validate_presence_of(:capacity)
      should validate_numericality_of(:capacity).only_integer.is_greater_than(0)
      should validate_presence_of(:number)
      should validate_inclusion_of(:available).in_array([true, false])
    end
  end

  describe '.available_table' do
    before(:each) do
      @reservation_time = Time.current + 1.hour
    end

    it 'returns the first available table based on party size and reservation time' do
      table = Table.create!(capacity: 4, number: "T1")
      expect(Table.available_table(2, @reservation_time)).to eq(table)
    end

    it 'returns nil if no tables are available' do
      Table.delete_all
      expect(Table.available_table(2, @reservation_time)).to be_nil
    end
  end

  describe '#default values' do
    it 'sets available to true by default' do
      table = Table.create
      expect(table.available).to be true
    end

    it 'does not change available if it is already set' do
      table = Table.create(available: false)
      expect(table.available).to be false
    end
  end
end
