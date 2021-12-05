require 'spec_helper'

describe 'bool2num' do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError) }

<<<<<<< HEAD
  [true, 'true', 't', '1', 'y', 'yes', AlsoString.new('true')].each do |truthy|
    it { is_expected.to run.with_params(truthy).and_return(1) }
  end

  [false, 'false', 'f', '0', 'n', 'no', AlsoString.new('false')].each do |falsey|
=======
  [true, 'true', AlsoString.new('true')].each do |truthy|
    it { is_expected.to run.with_params(truthy).and_return(1) }
  end

  [false, 'false', AlsoString.new('false')].each do |falsey|
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    it { is_expected.to run.with_params(falsey).and_return(0) }
  end

  [[], 10, 'invalid', 1.0].each do |falsey|
    it { is_expected.to run.with_params(falsey).and_raise_error(Puppet::ParseError) }
  end
end
