require 'spec_helper'
describe 'config' do
  context 'with default values for all parameters' do
    it { should contain_class('config') }
  end
end
