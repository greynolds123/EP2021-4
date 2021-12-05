require 'spec_helper'

describe 'basename' do
  it { is_expected.not_to eq(nil) }
<<<<<<< HEAD
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{No arguments given}) }
  it { is_expected.to run.with_params('one', 'two', 'three').and_raise_error(Puppet::ParseError, %r{Too many arguments given}) }
  it { is_expected.to run.with_params([]).and_raise_error(Puppet::ParseError, %r{Requires string as first argument}) }
  it { is_expected.to run.with_params('/path/to/a/file.ext', []).and_raise_error(Puppet::ParseError, %r{Requires string as second argument}) }
=======
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params('one', 'two', 'three').and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params([]).and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params('/path/to/a/file.ext', []).and_raise_error(Puppet::ParseError) }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  it { is_expected.to run.with_params('/path/to/a/file.ext').and_return('file.ext') }
  it { is_expected.to run.with_params('relative_path/to/a/file.ext').and_return('file.ext') }
  it { is_expected.to run.with_params('/path/to/a/file.ext', '.ext').and_return('file') }
  it { is_expected.to run.with_params('relative_path/to/a/file.ext', '.ext').and_return('file') }
  it { is_expected.to run.with_params('scheme:///path/to/a/file.ext').and_return('file.ext') }

  context 'with UTF8 and double byte characters' do
    it { is_expected.to run.with_params('scheme:///√ạĺűē/竹.ext').and_return('竹.ext') }
    it { is_expected.to run.with_params('ҝẽγ:/√ạĺűē/竹.ㄘ', '.ㄘ').and_return('竹') }
  end
end
