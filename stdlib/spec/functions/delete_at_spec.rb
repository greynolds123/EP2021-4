require 'spec_helper'

describe 'delete_at' do
  it { is_expected.not_to eq(nil) }
<<<<<<< HEAD
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{Wrong number of arguments}) }
  it { is_expected.to run.with_params('one', 1).and_raise_error(Puppet::ParseError, %r{Requires array}) }
  it { is_expected.to run.with_params(1, 1).and_raise_error(Puppet::ParseError, %r{Requires array}) }
  it { is_expected.to run.with_params(['one'], 'two').and_raise_error(Puppet::ParseError, %r{You must provide non-negative numeric}) }
=======
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params('one', 1).and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params(1, 1).and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params(['one'], 'two').and_raise_error(Puppet::ParseError) }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  it {
    pending('Current implementation ignores parameters after the first two.')
    is_expected.to run.with_params(['one'], 0, 1).and_raise_error(Puppet::ParseError)
  }

  describe 'argument validation' do
    it { is_expected.to run.with_params([0, 1, 2], 3).and_raise_error(Puppet::ParseError, %r{Given index exceeds size of array}) }
  end

  it { is_expected.to run.with_params([0, 1, 2], 1).and_return([0, 2]) }
  it { is_expected.to run.with_params([0, 1, 2], -1).and_return([0, 1]) }
  it { is_expected.to run.with_params([0, 1, 2], -4).and_return([0, 1, 2]) }
<<<<<<< HEAD
  it { is_expected.to run.with_params(['ƒờở', 'βāř', 'ьầż'], 1).and_return(['ƒờở', 'ьầż']) }
=======
  it { is_expected.to run.with_params(%w[ƒờở βāř ьầż], 1).and_return(%w[ƒờở ьầż]) }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

  it 'leaves the original array intact' do
    argument = [1, 2, 3]
    original = argument.dup
<<<<<<< HEAD
    _result = subject.execute(argument, 2)
=======
    _result = subject.call([argument, 2])
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    expect(argument).to eq(original)
  end
end
