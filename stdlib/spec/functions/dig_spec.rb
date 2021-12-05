require 'spec_helper'

describe 'dig' do
  it 'exists' do
    expect(Puppet::Parser::Functions.function('dig')).to eq('function_dig')
  end

  it 'gives a deprecation warning when called' do
<<<<<<< HEAD
    expect(scope).to receive(:warning).with('dig() DEPRECATED: This function has been replaced in Puppet 4.5.0, please use dig44() for backwards compatibility or use the new version.')
=======
    scope.expects(:warning).with('dig() DEPRECATED: This function has been replaced in Puppet 4.5.0, please use dig44() for backwards compatibility or use the new version.')
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    scope.function_dig([{}, []])
  end
end
