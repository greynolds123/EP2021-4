require 'spec_helper'

describe 'uriescape' do
  describe 'signature validation' do
    it { is_expected.not_to eq(nil) }
    it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
    it {
      pending('Current implementation ignores parameters after the first.')
      is_expected.to run.with_params('', '').and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i)
    }
    it { is_expected.to run.with_params(1).and_raise_error(Puppet::ParseError, %r{Requires either array or string to work}) }
    it { is_expected.to run.with_params({}).and_raise_error(Puppet::ParseError, %r{Requires either array or string to work}) }
    it { is_expected.to run.with_params(true).and_raise_error(Puppet::ParseError, %r{Requires either array or string to work}) }
  end

  describe 'handling normal strings' do
    it 'calls ruby\'s URI.escape function' do
<<<<<<< HEAD
      expect(URI).to receive(:escape).with('uri_string').and_return('escaped_uri_string').once
=======
      URI.expects(:escape).with('uri_string').returns('escaped_uri_string').once
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
      is_expected.to run.with_params('uri_string').and_return('escaped_uri_string')
    end
  end

  describe 'handling classes derived from String' do
    it 'calls ruby\'s URI.escape function' do
      uri_string = AlsoString.new('uri_string')
<<<<<<< HEAD
      expect(URI).to receive(:escape).with(uri_string).and_return('escaped_uri_string').once
=======
      URI.expects(:escape).with(uri_string).returns('escaped_uri_string').once
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
      is_expected.to run.with_params(uri_string).and_return('escaped_uri_string')
    end
  end

  describe 'strings in arrays handling' do
    it { is_expected.to run.with_params([]).and_return([]) }
    it { is_expected.to run.with_params(['one}', 'two']).and_return(['one%7D', 'two']) }
    it { is_expected.to run.with_params(['one}', 1, true, {}, 'two']).and_return(['one%7D', 1, true, {}, 'two']) }
  end
end
