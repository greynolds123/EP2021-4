require 'spec_helper'

describe 'regexpescape' do
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
    it 'calls ruby\'s Regexp.escape function' do
<<<<<<< HEAD
      expect(Regexp).to receive(:escape).with('regexp_string').and_return('escaped_regexp_string').once
=======
      Regexp.expects(:escape).with('regexp_string').returns('escaped_regexp_string').once
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
      is_expected.to run.with_params('regexp_string').and_return('escaped_regexp_string')
    end
  end

  describe 'handling classes derived from String' do
    it 'calls ruby\'s Regexp.escape function' do
      regexp_string = AlsoString.new('regexp_string')
<<<<<<< HEAD
      expect(Regexp).to receive(:escape).with(regexp_string).and_return('escaped_regexp_string').once
=======
      Regexp.expects(:escape).with(regexp_string).returns('escaped_regexp_string').once
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
      is_expected.to run.with_params(regexp_string).and_return('escaped_regexp_string')
    end
  end

  describe 'strings in arrays handling' do
    it { is_expected.to run.with_params([]).and_return([]) }
    it { is_expected.to run.with_params(['one*', 'two']).and_return(['one\*', 'two']) }
    it { is_expected.to run.with_params(['one*', 1, true, {}, 'two']).and_return(['one\*', 1, true, {}, 'two']) }

    context 'with UTF8 and double byte characters' do
      it { is_expected.to run.with_params(['??????*']).and_return(['??????\*']) }
      it { is_expected.to run.with_params(['?????????????????????*']).and_return(['?????????????????????\*']) }
    end
  end
end
