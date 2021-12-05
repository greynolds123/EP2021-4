require 'spec_helper_acceptance'

<<<<<<< HEAD
describe 'strftime function', :if => Puppet::Util::Package.versioncmp(Puppet.version, '4.8.0') < 0 do
=======
describe 'strftime function' do
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  describe 'success' do
    pp = <<-DOC
      $o = strftime('%C')
      notice(inline_template('strftime is <%= @o.inspect %>'))
    DOC
    it 'gives the Century' do
      apply_manifest(pp, :catch_failures => true) do |r|
        expect(r.stdout).to match(%r{strftime is "20"})
      end
    end
    it 'takes a timezone argument'
  end
  describe 'failure' do
    it 'handles no arguments'
    it 'handles invalid format strings'
  end
end
