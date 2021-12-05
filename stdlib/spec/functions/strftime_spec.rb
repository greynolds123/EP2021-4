require 'spec_helper'

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
describe 'strftime', :if => Puppet::Util::Package.versioncmp(Puppet.version, '4.8.0') < 0 do
=======
describe 'strftime' do
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
describe 'strftime', :if => Puppet::Util::Package.versioncmp(Puppet.version, '4.8.0') < 0 do
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
describe 'strftime', :if => Puppet::Util::Package.versioncmp(Puppet.version, '4.8.0') < 0 do
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
describe 'strftime', :if => Puppet::Util::Package.versioncmp(Puppet.version, '4.8.0') < 0 do
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
  it 'exists' do
    expect(Puppet::Parser::Functions.function('strftime')).to eq('function_strftime')
  end

  it 'raises a ParseError if there is less than 1 arguments' do
    expect { scope.function_strftime([]) }.to(raise_error(Puppet::ParseError))
  end

  it 'using %s should be higher then when I wrote this test' do
    result = scope.function_strftime(['%s'])
    expect(result.to_i).to(be > 1_311_953_157)
  end

  it 'using %s should be greater than 1.5 trillion' do
    result = scope.function_strftime(['%s'])
    expect(result.to_i).to(be > 1_500_000_000)
  end

  it 'returns a date when given %Y-%m-%d' do
    result = scope.function_strftime(['%Y-%m-%d'])
    expect(result).to match(%r{^\d{4}-\d{2}-\d{2}$})
  end
end
