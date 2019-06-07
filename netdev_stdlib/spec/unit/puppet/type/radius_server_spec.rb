# encoding: utf-8

require 'spec_helper'
<<<<<<< HEAD

describe Puppet::Type.type(:radius_server) do
  let(:catalog) { Puppet::Resource::Catalog.new }
  let(:type) { described_class.new(name: 'emanon', catalog: catalog) }
  subject { described_class.attrclass(attribute) }

  it_behaves_like 'name is the namevar'
  it_behaves_like 'it has a string property', :key

  describe 'key_format' do
    let(:attribute) { :key_format }
    include_examples 'numeric parameter', min: 0, max: 7
  end

  it_behaves_like 'it has a string property', :group

  describe 'deadtime' do
    let(:attribute) { :deadtime }
    include_examples 'numeric parameter', min: 0, max: 10_080
  end

  describe 'timeout' do
    let(:attribute) { :timeout }
    include_examples 'numeric parameter', min: 0, max: 604_800
  end

  it_behaves_like 'it has a string property', :vrf
  it_behaves_like 'it has a string property', :source_interface

  describe 'retransmit_count' do
    let(:attribute) { :retransmit_count }
    include_examples 'numeric parameter', min: 0, max: 2048
  end

  describe 'acct_port' do
    let(:attribute) { :acct_port }
    include_examples 'numeric parameter', min: 0, max: 65_535
  end

  it_behaves_like 'boolean', attribute: :accounting_only

  describe 'auth_port' do
    let(:attribute) { :auth_port }
    include_examples 'numeric parameter', min: 0, max: 65_535
  end

  it_behaves_like 'boolean', attribute: :authentication_only
=======
describe 'radius_server' do
  describe 'old style' do
    fake_operatingsystem
    describe Puppet::Type.type(:radius_server) do
      let(:catalog) { Puppet::Resource::Catalog.new }
      let(:type) { described_class.new(name: 'emanon', catalog: catalog) }
      subject { described_class.attrclass(attribute) }

      it_behaves_like 'name is the namevar'
      it_behaves_like 'it has a string property', :key

      describe 'key_format' do
        let(:attribute) { :key_format }
        include_examples 'numeric parameter', min: 0, max: 7
      end

      it_behaves_like 'it has a string property', :group

      describe 'deadtime' do
        let(:attribute) { :deadtime }
        include_examples 'numeric parameter', min: 0, max: 10_080
      end

      describe 'timeout' do
        let(:attribute) { :timeout }
        include_examples 'numeric parameter', min: 0, max: 604_800
      end

      it_behaves_like 'it has a string property', :vrf
      it_behaves_like 'it has a string property', :source_interface

      describe 'retransmit_count' do
        let(:attribute) { :retransmit_count }
        include_examples 'numeric parameter', min: 0, max: 2048
      end

      describe 'acct_port' do
        let(:attribute) { :acct_port }
        include_examples 'numeric parameter', min: 0, max: 65_535
      end

      it_behaves_like 'boolean', attribute: :accounting_only

      describe 'auth_port' do
        let(:attribute) { :auth_port }
        include_examples 'numeric parameter', min: 0, max: 65_535
      end

      it_behaves_like 'boolean', attribute: :authentication_only
    end
  end
  describe 'resource-api' do
    describe 'the radius_server type' do
      it 'loads' do
        expect(Puppet::Type.type(:radius_server)).not_to be_nil
      end
    end
  end
>>>>>>> f661b3a03526f113b1823084ffd4808cf261cf70
end
