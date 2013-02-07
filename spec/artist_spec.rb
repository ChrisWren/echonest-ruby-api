require 'spec_helper'
require 'base'

describe Echonest::Artist do

  it 'should allow an Artist to have a name' do
    a = Echonest::Artist.new('Weezer', '12345')
    a.name.should eql 'Weezer'
  end

  it 'should download a specified number of biographies' do
    a = Echonest::Artist.new('Weezer', 'BNOAEBT3IZYZI6WXI')
    a.biographies(results: 10).count.should be 10
  end

  it 'should return one biography by default' do
    a = Echonest::Artist.new('Weezer', 'BNOAEBT3IZYZI6WXI')
    a.biographies.count.should be 1
  end

  it 'should deal gracefully with an invalid API key' do
    a = Echonest::Artist.new('Weezer', 'THISISNOTAKEY')
    expect { a.biographies }.to raise_error(ArgumentError)
  end

  it 'should download a specified number of blogs' do
    a = Echonest::Artist.new('Weezer', 'BNOAEBT3IZYZI6WXI')
    a.blogs(results: 10).count.should be 10
  end

  it 'should return one blog by default' do
    a = Echonest::Artist.new('Weezer', 'BNOAEBT3IZYZI6WXI')
    a.blogs.count.should be 1
  end

end