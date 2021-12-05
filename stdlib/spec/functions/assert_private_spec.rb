require 'spec_helper'

describe 'assert_private' do
  context 'when called from inside module' do
    it 'does not fail' do
<<<<<<< HEAD
      expect(scope).to receive(:lookupvar).with('module_name').and_return('foo')
      expect(scope).to receive(:lookupvar).with('caller_module_name').and_return('foo')
=======
      scope.expects(:lookupvar).with('module_name').returns('foo')
      scope.expects(:lookupvar).with('caller_module_name').returns('foo')
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

      is_expected.to run.with_params
    end
  end

  context 'when called from private class' do
<<<<<<< HEAD
    it 'fails with a class error message' do
      expect(scope).to receive(:lookupvar).with('module_name').and_return('foo')
      expect(scope).to receive(:lookupvar).with('caller_module_name').and_return('bar')
      expect(scope.source).to receive(:name).and_return('foo::baz')
      expect(scope.source).to receive(:type).and_return('hostclass')
=======
    before :each do
      scope.expects(:lookupvar).with('module_name').returns('foo')
      scope.expects(:lookupvar).with('caller_module_name').returns('bar')
    end

    it 'fails with a class error message' do
      scope.source.expects(:name).returns('foo::baz')
      scope.source.expects(:type).returns('hostclass')
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

      is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{Class foo::baz is private})
    end

<<<<<<< HEAD
    it 'fails with an explicit failure message' do
      is_expected.to run.with_params('failure message!').and_raise_error(Puppet::ParseError, %r{failure message!})
=======
    context 'with an explicit failure message' do
      it { is_expected.to run.with_params('failure message!').and_raise_error(Puppet::ParseError, %r{failure message!}) }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    end
  end

  context 'when called from private definition' do
    it 'fails with a class error message' do
<<<<<<< HEAD
      expect(scope).to receive(:lookupvar).with('module_name').and_return('foo')
      expect(scope).to receive(:lookupvar).with('caller_module_name').and_return('bar')
      expect(scope.source).to receive(:name).and_return('foo::baz')
      expect(scope.source).to receive(:type).and_return('definition')
=======
      scope.expects(:lookupvar).with('module_name').returns('foo')
      scope.expects(:lookupvar).with('caller_module_name').returns('bar')
      scope.source.expects(:name).returns('foo::baz')
      scope.source.expects(:type).returns('definition')
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

      is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{Definition foo::baz is private})
    end
  end
end
