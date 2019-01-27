require 'spec_helper'

describe 'merge' do
  it { is_expected.not_to eq(nil) }
<<<<<<< HEAD
  it { is_expected.to run.with_params().and_raise_error(Puppet::ParseError, /wrong number of arguments/i) }
  it { is_expected.to run.with_params({}, 'two').and_raise_error(Puppet::ParseError, /unexpected argument type String/) }
  it { is_expected.to run.with_params({}, 1).and_raise_error(Puppet::ParseError, /unexpected argument type Fixnum/) }
=======
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
  it { is_expected.to run.with_params({}, 'two').and_raise_error(Puppet::ParseError, %r{unexpected argument type String}) }
  it { is_expected.to run.with_params({}, 1).and_raise_error(Puppet::ParseError, %r{unexpected argument type (Fixnum|Integer)}) }
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
  it {
    pending 'should not special case this'
    is_expected.to run.with_params({}).and_return({})
  }
  it { is_expected.to run.with_params({}, {}).and_return({}) }
  it { is_expected.to run.with_params({}, {}, {}).and_return({}) }
  describe 'should accept empty strings as puppet undef' do
    it { is_expected.to run.with_params({}, '').and_return({}) }
  end
<<<<<<< HEAD
  it { is_expected.to run.with_params({ 'key' => 'value' }, {}).and_return({ 'key' => 'value' }) }
  it { is_expected.to run.with_params({}, { 'key' => 'value' }).and_return({ 'key' => 'value' }) }
  it { is_expected.to run.with_params({ 'key' => 'value1' }, { 'key' => 'value2' }).and_return({ 'key' => 'value2' }) }
  it {
    is_expected.to run \
      .with_params({ 'key1' => 'value1' }, { 'key2' => 'value2' }, { 'key3' => 'value3' }) \
      .and_return({ 'key1' => 'value1', 'key2' => 'value2', 'key3' => 'value3' })
=======
  it { is_expected.to run.with_params({ 'key' => 'value' }, {}).and_return('key' => 'value') }
  it { is_expected.to run.with_params({}, 'key' => 'value').and_return('key' => 'value') }
  it { is_expected.to run.with_params({ 'key' => 'value1' }, 'key' => 'value2').and_return('key' => 'value2') }
  it {
    is_expected.to run \
      .with_params({ 'key1' => 'value1' }, { 'key2' => 'value2' }, 'key3' => 'value3') \
      .and_return('key1' => 'value1', 'key2' => 'value2', 'key3' => 'value3')
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
  }
end
