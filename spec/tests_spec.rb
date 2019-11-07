# frozen_string_literal: true

require './enumerable.rb'

RSpec.describe 'Enumerable' do
  let(:ara) { [1, 2, 3, 4, 5] }
  describe '#my_each' do
    let(:enum) { [1, 2, 3, 4, 5] }
    it 'loops through the array' do
      r = ara
      t = []
      ara.my_each { |x| t << x }
      expect(t).to eql(r)
    end
    it 'returns an enumerator when no block is given' do
      expect(ara.my_each.is_a?(Enumerator)).to eql(true)
    end
  end
  describe '#my_each_with_index' do
    it 'loops through the array and gives you the indexes' do
      r = (0..ara.size - 1).to_a
      t = []
      ara.my_each_with_index { |_i, ind| t << ind }
      expect(t).to eql(r)
    end
    it 'returns an enumerator when no block is given' do
      expect(ara.my_each_with_index.is_a?(Enumerator)).to eql(true)
    end
  end
  describe '#my_select' do
    it 'selects items using a conditional' do
      expect(ara.my_select { |x| x > 3 }).to eql(ara.select { |x| x > 3 })
    end
    it 'returns an enumerator when no block is given' do
      expect(ara.my_select.is_a?(Enumerator)).to eql(true)
    end
  end
  describe '#my_all?' do
    it 'return true if every item complies some condition when a block is given' do
      expect(ara.my_all? { |x| x > 3 }).to eql(ara.all? { |x| x > 3 })
    end
    it 'return true if every item complies some condition when a condition is given' do
      expect(ara.my_all?(3)).to eql(ara.all?(3))
    end
    it 'return true if every item is defined' do
      expect(ara.my_all?).to eql(ara.all?)
    end
  end
  describe '#my_any?' do
    it 'return true if atleast one item complies some condition when a block is given' do
      expect(ara.my_any? { |x| x > 3 }).to eql(ara.any? { |x| x > 3 })
    end
    it 'return true if atleast one complies some condition when a condition is given' do
      expect(ara.my_any?(3)).to eql(ara.any?(3))
    end
    it 'return true if atleast one item is defined' do
      expect(ara.my_any?).to eql(ara.any?)
    end
  end
  describe '#my_none?' do
    it 'return true if no item complies some condition when a block is given' do
      expect(ara.my_none? { |x| x > 3 }).to eql(ara.none? { |x| x > 3 })
    end
    it 'return true if no every item complies some condition when a condition is given' do
      expect(ara.my_none?(3)).to eql(ara.none?(3))
    end
    it 'return true if all items are nil or false' do
      expect(ara.my_none?).to eql(ara.none?)
    end
  end
  describe '#my_count' do
    it 'return the number of appeareances of an item' do
      expect(ara.my_count(4)).to eql(ara.count(4))
    end
  end
  describe '#my_map' do
    let(:ara_map) { [1, 2, 3, 4, 5] }
    let(:ara_my_map) { [1, 2, 3, 4, 5] }
    it 'returns mapping of a list using a block' do
      expect(ara_my_map.my_map { |x| x + 1 }).to eql(ara_map.map { |x| x + 1 })
    end
    it 'returns an enumerator when no block is given' do
      expect(ara.my_map.is_a?(Enumerator)).to eql(true)
    end
  end
  describe '#my_inject' do
    it 'returns mapping of a list using a block' do
      expect(ara.my_inject(:+)).to eql(ara.inject(:+))
    end
  end
end
