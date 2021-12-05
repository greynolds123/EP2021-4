require 'spec_helper'
require 'puppet'

provider_class = Puppet::Type.type(:ini_setting).provider(:ruby)
describe provider_class do
  include PuppetlabsSpec::Files

<<<<<<< HEAD
  let(:tmpfile) { tmpfilename('ini_setting_test') }
  let(:emptyfile) { tmpfilename('ini_setting_test_empty') }

  let(:common_params) do
    {
      title: 'ini_setting_ensure_present_test',
      path: tmpfile,
      section: 'section2',
    }
  end

  def validate_file(expected_content, tmpfile)
    expect(File.read(tmpfile)).to eq(expected_content)
  end

=======
  let(:tmpfile) { tmpfilename("ini_setting_test") }
  let(:emptyfile) { tmpfilename("ini_setting_test_empty") }

  let(:common_params) { {
      :title    => 'ini_setting_ensure_present_test',
      :path     => tmpfile,
      :section  => 'section2',
  } }

  def validate_file(expected_content,tmpfile = tmpfile)
    expect(File.read(tmpfile)).to eq(expected_content)
  end


>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
  before :each do
    File.open(tmpfile, 'w') do |fh|
      fh.write(orig_content)
    end
    File.open(emptyfile, 'w') do |fh|
<<<<<<< HEAD
      fh.write('')
=======
      fh.write("")
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    end
  end

  context 'when calling instances' do
<<<<<<< HEAD
=======

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    let :orig_content do
      ''
    end

<<<<<<< HEAD
    it 'fails when file path is not set' do
=======
    it 'should fail when file path is not set' do
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      expect {
        provider_class.instances
      }.to raise_error(Puppet::Error, 'Ini_settings only support collecting instances when a file path is hard coded')
    end

    context 'when file path is set by a child class' do
<<<<<<< HEAD
      child_one = Class.new(provider_class) do
        def self.file_path
          emptyfile
        end
      end
      it 'returns [] when file is empty' do
        expect(child_one).to receive(:file_path).and_return(emptyfile)
        expect(child_one.instances).to eq([])
      end
      child_two = Class.new(provider_class) do
        def self.file_path
          '/some/file/path'
        end
      end
      it 'overrides the provider instances file_path' do
        resource = Puppet::Type::Ini_setting.new(common_params)
        provider = child_two.new(resource)
        expect(provider.file_path).to eq('/some/file/path')
      end
    end

    context 'when file has contecnts' do
      let(:orig_content) do
        <<-EOS
          # This is a comment
          [section1]
          ; This is also a comment
          foo=foovalue

          bar = barvalue
          master = true
          [section2]

          foo= foovalue2
          baz=bazvalue
          url = http://192.168.1.1:8080
          [section:sub]
          subby=bar
              #another comment
           ; yet another comment
        EOS
      end

      it 'is able to parse the results' do
        child_three = Class.new(provider_class) do
=======
      it 'should return [] when file is empty' do
        child_one = Class.new(provider_class) do
          def self.file_path
            emptyfile
          end
        end
        child_one.stubs(:file_path).returns(emptyfile)
        expect(child_one.instances).to eq([])
      end
      it 'should override the provider instances file_path' do
        child_two = Class.new(provider_class) do
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
          def self.file_path
            '/some/file/path'
          end
        end
<<<<<<< HEAD
        expect(child_three).to receive(:file_path).exactly(2).times.and_return(tmpfile)
        expect(child_three.instances.size).to eq(7)
        expected_array = [
          { name: 'section1/foo', value: 'foovalue' },
          { name: 'section1/bar', value: 'barvalue' },
          { name: 'section1/master', value: 'true' },
          { name: 'section2/foo', value: 'foovalue2' },
          { name: 'section2/baz', value: 'bazvalue' },
          { name: 'section2/url', value: 'http://192.168.1.1:8080' },
          { name: 'section:sub/subby', value: 'bar' },
        ]
        real_array = []
        ensure_array = []
        child_three.instances.each do |x|
          prop_hash    = x.instance_variable_get(:@property_hash)
          ensure_value = prop_hash.delete(:ensure)
          ensure_array.push(ensure_value)
          real_array.push(prop_hash)
        end
        expect(ensure_array.uniq).to eq([:present])
        expect((real_array - expected_array) && (expected_array - real_array)).to eq([])
      end
      # rubocop:enable RSpec/ExampleLength
      # rubocop:enable RSpec/MultipleExpectations
    end
  end

  context 'when ensuring that a setting is present' do
    let(:orig_content) do
      <<-EOS
=======
        resource = Puppet::Type::Ini_setting.new(common_params)
        provider = child_two.new(resource)
        expect(provider.file_path).to eq('/some/file/path')
      end
      context 'when file has contecnts' do
        let(:orig_content) {
          <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section:sub]
subby=bar
    #another comment
 ; yet another comment
<<<<<<< HEAD

-nonstandard-
  shoes = purple
      EOS
    end

    expected_content_one = <<-EOS
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
yahoo = yippee
[section:sub]
subby=bar
    #another comment
 ; yet another comment

-nonstandard-
  shoes = purple
    EOS
    it 'adds a missing setting to the correct section' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(setting: 'yahoo', value: 'yippee'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_one, tmpfile)
    end

    expected_content_two = <<-EOS
=======
          EOS
        }

        it 'should be able to parse the results' do
          child_three = Class.new(provider_class) do
            def self.file_path
              '/some/file/path'
            end
          end
          child_three.stubs(:file_path).returns(tmpfile)
          expect(child_three.instances.size).to eq(7)
          expected_array = [
            {:name => 'section1/foo', :value => 'foovalue' },
            {:name => 'section1/bar', :value => 'barvalue' },
            {:name => 'section1/master', :value => 'true' },
            {:name => 'section2/foo', :value => 'foovalue2' },
            {:name => 'section2/baz', :value => 'bazvalue' },
            {:name => 'section2/url', :value => 'http://192.168.1.1:8080' },
            {:name => 'section:sub/subby', :value => 'bar' }
          ]
          real_array = []
          ensure_array = []
          child_three.instances.each do |x|
            prop_hash    = x.instance_variable_get(:@property_hash)
            ensure_value = prop_hash.delete(:ensure)
            ensure_array.push(ensure_value)
            real_array.push(prop_hash)
          end
          expect(ensure_array.uniq).to eq([:present])
          expect(((real_array - expected_array) && (expected_array - real_array))).to eq([])

        end

      end

    end

  end

  context "when ensuring that a setting is present" do
    let(:orig_content) {
      <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section:sub]
subby=bar
    #another comment
 ; yet another comment

-nonstandard-
  shoes = purple
<<<<<<< HEAD
  yahoo = yippee
    EOS
    it 'adds a missing setting to the correct section with pre/suffix' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'nonstandard', setting: 'yahoo', value: 'yippee', section_prefix: '-', section_suffix: '-'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_two, tmpfile)
    end

    expected_content_three = <<-EOS
=======
      EOS
    }

    it "should add a missing setting to the correct section" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
          :setting => 'yahoo', :value => 'yippee'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
<<<<<<< HEAD
=======
yahoo = yippee
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
[section:sub]
subby=bar
    #another comment
 ; yet another comment

-nonstandard-
  shoes = purple
<<<<<<< HEAD
		indented = weirdly
    EOS
    it 'adds a missing setting to the correct section with indent_char' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'nonstandard', setting: 'indented', value: 'weirdly', section_prefix: '-', section_suffix: '-', indent_char: "\t"))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_three, tmpfile)
    end

    expected_content_four = <<-EOS
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section:sub]
subby=bar
    #another comment
 ; yet another comment

-nonstandard-
  shoes = purple
				indented = weirdly
    EOS
    it 'adds a missing setting to the correct section indented by indent_char * indent_width' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'nonstandard', setting: 'indented', value: 'weirdly',
                                                                   section_prefix: '-', section_suffix: '-', indent_char: "\t", indent_width: 4))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_four, tmpfile)
    end

    expected_content_five = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should add a missing setting to the correct section with pre/suffix" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
          :section => 'nonstandard',
          :setting => 'yahoo', :value => 'yippee',
          :section_prefix => '-', :section_suffix => '-'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section:sub]
subby=bar
    #another comment
 ; yet another comment

-nonstandard-
  shoes = purple
<<<<<<< HEAD
				indented = weirdly
    EOS
    it 'treats a string indent_width as an integer' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'nonstandard', setting: 'indented', value: 'weirdly',
                                                                   section_prefix: '-', section_suffix: '-', indent_char: "\t", indent_width: '4'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_five, tmpfile)
    end

    expected_content_six = <<-EOS
=======
  yahoo = yippee
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should add a missing setting to the correct section with colon" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
          :section => 'section:sub', :setting => 'yahoo', :value => 'yippee'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section:sub]
subby=bar
    #another comment
 ; yet another comment

-nonstandard-
  shoes = purple
yahoo = yippee
<<<<<<< HEAD
    EOS
    it 'adds a missing setting to the correct section with colon' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section:sub', setting: 'yahoo', value: 'yippee'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_six, tmpfile)
    end

    expected_content_seven = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should modify an existing setting with a different value" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
           :setting => 'baz', :value => 'bazvalue2'))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.value=('bazvalue2')
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue2
url = http://192.168.1.1:8080
[section:sub]
subby=bar
    #another comment
 ; yet another comment

-nonstandard-
  shoes = purple
<<<<<<< HEAD
    EOS
    it 'modifies an existing setting with a different value' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(setting: 'baz', value: 'bazvalue2'))
      provider = described_class.new(resource)
      expect(provider).to be_exists
      provider.value = 'bazvalue2'
      validate_file(expected_content_seven, tmpfile)
    end

    expected_content_eight = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should modify an existing setting with a different boolean value" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
        :section => 'section1', :setting => 'master', :value => false))
      provider = described_class.new(resource)
      provider.exists?.should be true
      transaction = double('transaction', :persistence => true)
      expect(Puppet::Transaction::ResourceHarness.new(transaction).evaluate(provider.resource).out_of_sync).to eq(true)
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = false
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section:sub]
subby=bar
    #another comment
 ; yet another comment

-nonstandard-
  shoes = purple
<<<<<<< HEAD
    EOS
    it 'modifies an existing setting with a different boolean value' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section1', setting: 'master', value: false))
      provider = described_class.new(resource)
      expect(provider.exists?).to be true
      transaction = instance_double('transaction', persistence: true)
      expect(Puppet::Transaction::ResourceHarness.new(transaction).evaluate(provider.resource).out_of_sync).to eq(true)
      validate_file(expected_content_eight, tmpfile)
    end
    # rubocop:enable RSpec/MultipleExpectations : Unable to reduce without altering test

    expected_content_nine = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should modify an existing setting with pre/suffix with a different value" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
           :section => 'nonstandard',
           :setting => 'shoes', :value => 'orange',
           :section_prefix => '-', :section_suffix => '-' ))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.value=('orange')
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section:sub]
subby=bar
    #another comment
 ; yet another comment

-nonstandard-
  shoes = orange
<<<<<<< HEAD
    EOS
    it 'modifies an existing setting with pre/suffix with a different value' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'nonstandard', setting: 'shoes', value: 'orange', section_prefix: '-', section_suffix: '-'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be true
      provider.value = 'orange'
      validate_file(expected_content_nine, tmpfile)
    end

    expected_content_ten = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should modify an existing setting with a different value - with colon in section" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
           :section => 'section:sub', :setting => 'subby', :value => 'foo'))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.value.should eq('bar')
      provider.value=('foo')
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section:sub]
subby=foo
    #another comment
 ; yet another comment

-nonstandard-
  shoes = purple
<<<<<<< HEAD
    EOS
    it 'modifies an existing setting with a different value - with colon in section' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section:sub', setting: 'subby', value: 'foo'))
      provider = described_class.new(resource)
      expect(provider.value).to eq('bar')
      provider.value = 'foo'
      validate_file(expected_content_ten, tmpfile)
    end

    expected_content_eleven = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should be able to handle settings with non alphanumbering settings " do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
           :setting => 'url', :value => 'http://192.168.0.1:8080'))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.value.should eq('http://192.168.1.1:8080')
      provider.value=('http://192.168.0.1:8080')
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.0.1:8080
[section:sub]
subby=bar
    #another comment
 ; yet another comment

-nonstandard-
  shoes = purple
    EOS
<<<<<<< HEAD
    it 'is able to handle settings with non alphanumbering settings' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(setting: 'url', value: 'http://192.168.0.1:8080'))
      provider = described_class.new(resource)
      expect(provider.value).to eq('http://192.168.1.1:8080')
      provider.value = 'http://192.168.0.1:8080'
      validate_file(expected_content_eleven, tmpfile)
    end

    expected_content_twelve = <<-EOS
=======
      validate_file(expected_content, tmpfile)
    end

    it "should be able to handle settings with pre/suffix with non alphanumbering settings " do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
           :section => 'nonstandard',
           :setting => 'shoes', :value => 'http://192.168.0.1:8080',
           :section_prefix => '-', :section_suffix => '-' ))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.value.should eq('purple')
      provider.value=('http://192.168.0.1:8080')
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section:sub]
subby=bar
    #another comment
 ; yet another comment

-nonstandard-
  shoes = http://192.168.0.1:8080
    EOS
<<<<<<< HEAD
    it 'is able to handle settings with pre/suffix with non alphanumbering settings' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'nonstandard', setting: 'shoes', value: 'http://192.168.0.1:8080', section_prefix: '-', section_suffix: '-'))
      provider = described_class.new(resource)
      expect(provider.value).to eq('purple')
      provider.value = 'http://192.168.0.1:8080'
      validate_file(expected_content_twelve, tmpfile)
    end

    it 'recognizes an existing setting with the specified value' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(setting: 'baz', value: 'bazvalue'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be true
    end

    it 'recognizes an existing setting with pre/suffix with the specified value' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'nonstandard', setting: 'shoes', value: 'purple',
                                                                   section_prefix: '-', section_suffix: '-'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be true
    end

    expected_content_thirteen = <<-EOS
=======
      validate_file(expected_content, tmpfile)
    end

    it "should recognize an existing setting with the specified value" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
           :setting => 'baz', :value => 'bazvalue'))
      provider = described_class.new(resource)
      provider.exists?.should be true
    end

    it "should recognize an existing setting with pre/suffix with the specified value" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
           :section => 'nonstandard',
           :setting => 'shoes', :value => 'purple',
           :section_prefix => '-', :section_suffix => '-' ))
      provider = described_class.new(resource)
      provider.exists?.should be true
    end

    it "should add a new section if the section does not exist" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
          :section => "section3", :setting => 'huzzah', :value => 'shazaam'))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section:sub]
subby=bar
    #another comment
 ; yet another comment

-nonstandard-
  shoes = purple

[section3]
huzzah = shazaam
<<<<<<< HEAD
    EOS
    it 'adds a new section if the section does not exist' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section3', setting: 'huzzah', value: 'shazaam'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_thirteen, tmpfile)
    end

    expected_content_fourteen = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should add a new section with pre/suffix if the section does not exist" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
          :section => "section3", :setting => 'huzzah', :value => 'shazaam',
          :section_prefix => '-', :section_suffix => '-' ))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section:sub]
subby=bar
    #another comment
 ; yet another comment

-nonstandard-
  shoes = purple

-section3-
huzzah = shazaam
<<<<<<< HEAD
    EOS
    it 'adds a new section with pre/suffix if the section does not exist' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section3', setting: 'huzzah', value: 'shazaam', section_prefix: '-', section_suffix: '-'))
      provider = described_class.new(resource)
      expect(provider).not_to be_exists
      provider.create
      validate_file(expected_content_fourteen, tmpfile)
    end

    expected_content_fifteen = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should add a new section if the section does not exist - with colon" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
          :section => "section:subsection", :setting => 'huzzah', :value => 'shazaam'))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section:sub]
subby=bar
    #another comment
 ; yet another comment

-nonstandard-
  shoes = purple

[section:subsection]
huzzah = shazaam
<<<<<<< HEAD
    EOS
    it 'adds a new section if the section does not exist - with colon' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section:subsection', setting: 'huzzah', value: 'shazaam'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_fifteen, tmpfile)
    end

    expected_content_sixteen = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should add a new section with pre/suffix if the section does not exist - with colon" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
          :section => "section:subsection", :setting => 'huzzah', :value => 'shazaam',
          :section_prefix => '-', :section_suffix => '-' ))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section:sub]
subby=bar
    #another comment
 ; yet another comment

-nonstandard-
  shoes = purple

-section:subsection-
huzzah = shazaam
<<<<<<< HEAD
    EOS
    it 'adds a new section with pre/suffix if the section does not exist - with colon' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section:subsection', setting: 'huzzah', value: 'shazaam', section_prefix: '-', section_suffix: '-'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_sixteen, tmpfile)
    end

    it 'adds a new empty section' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(orig_content + "\n[section]\n", tmpfile)
    end

    it 'is able to handle variables of any type' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section1', setting: 'master', value: true))
      provider = described_class.new(resource)
      expect(provider.value).to eq('true')
    end
  end

  context 'when no sections exist' do
    let(:orig_content) do
      ''
    end

    validate_zero = "[section]\n"

    it 'adds an empty section' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section', path: emptyfile))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(validate_zero, emptyfile)
    end

    validate_one = '[section1]
setting1 = hellowworld
'
    it 'adds a new section' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section1', setting: 'setting1', value: 'hellowworld', path: emptyfile))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(validate_one, emptyfile)
    end

    validate_two = '-section1-
setting1 = hellowworld
'
    it 'adds a new section with pre/suffix' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section1', setting: 'setting1', value: 'hellowworld', path: emptyfile, section_prefix: '-', section_suffix: '-'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(validate_two, emptyfile)
    end

    validate_three = '[section:subsection]
setting1 = hellowworld
'
    it 'adds a new section with colon' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section:subsection', setting: 'setting1', value: 'hellowworld', path: emptyfile))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(validate_three, emptyfile)
    end

    validate_four = '-section:subsection-
setting1 = hellowworld
'
    it 'adds a new section with pre/suffix with colon' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section:subsection', setting: 'setting1', value: 'hellowworld', path: emptyfile, section_prefix: '-', section_suffix: '-'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(validate_four, emptyfile)
    end
  end

  context 'when only an empty section exists' do
    let(:orig_content) do
      "[section]\n"
    end

    it 'adds a new setting' do
      expected = orig_content
      { 'section' => { 'first' => 1 } }.each_pair do |section, settings|
        settings.each_pair do |setting, value|
          resource = Puppet::Type::Ini_setting.new(common_params.merge(section: section, setting: setting, value: value))
          provider = described_class.new(resource)
          expect(provider.exists?).to be false
          # byebug
          provider.create
          expected += "#{setting} = #{value}\n"
        end
      end
      validate_file(expected, tmpfile)
    end
  end

  context 'when dealing with a global section' do
    let(:orig_content) do
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should add a new section if no sections exists" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
          :section => "section1", :setting => 'setting1', :value => 'hellowworld', :path => emptyfile))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      validate_file("
[section1]
setting1 = hellowworld
", emptyfile)
    end

    it "should add a new section with pre/suffix if no sections exists" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
          :section => "section1", :setting => 'setting1', :value => 'hellowworld', :path => emptyfile,
          :section_prefix => '-', :section_suffix => '-' ))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      validate_file("
-section1-
setting1 = hellowworld
", emptyfile)
    end

    it "should add a new section with colon if no sections exists" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
          :section => "section:subsection", :setting => 'setting1', :value => 'hellowworld', :path => emptyfile))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      validate_file("
[section:subsection]
setting1 = hellowworld
", emptyfile)
    end

    it "should add a new section with pre/suffix with colon if no sections exists" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
          :section => "section:subsection", :setting => 'setting1', :value => 'hellowworld', :path => emptyfile,
          :section_prefix => '-', :section_suffix => '-' ))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      validate_file("
-section:subsection-
setting1 = hellowworld
", emptyfile)
    end
    it "should be able to handle variables of any type" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
          :section => "section1", :setting => 'master', :value => true))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.value.should == 'true'
    end

  end

  context "when dealing with a global section" do
    let(:orig_content) {
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      <<-EOS
# This is a comment
foo=blah
[section2]
foo = http://192.168.1.1:8080
 ; yet another comment
      EOS
<<<<<<< HEAD
    end

    expected_content_one = <<-EOS
=======
    }


    it "should add a missing setting if it doesn't exist" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
          :section => '', :setting => 'bar', :value => 'yippee'))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
foo=blah
bar = yippee
[section2]
foo = http://192.168.1.1:8080
 ; yet another comment
<<<<<<< HEAD
    EOS
    it "adds a missing setting if it doesn't exist" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: '', setting: 'bar', value: 'yippee'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_one, tmpfile)
    end

    expected_content_two = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should modify an existing setting with a different value" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
           :section => '', :setting => 'foo', :value => 'yippee'))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.value.should eq('blah')
      provider.value=('yippee')
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
foo=yippee
[section2]
foo = http://192.168.1.1:8080
 ; yet another comment
<<<<<<< HEAD
    EOS
    it 'modifies an existing setting with a different value' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: '', setting: 'foo', value: 'yippee'))
      provider = described_class.new(resource)
      expect(provider.value).to eq('blah')
      provider.value = 'yippee'
      validate_file(expected_content_two, tmpfile)
    end

    it 'recognizes an existing setting with the specified value' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: '', setting: 'foo', value: 'blah'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be true
    end
  end

  context 'when the first line of the file is a section' do
    let(:orig_content) do
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should recognize an existing setting with the specified value" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
           :section => '', :setting => 'foo', :value => 'blah'))
      provider = described_class.new(resource)
      provider.exists?.should be true
    end
  end

  context "when the first line of the file is a section" do
    let(:orig_content) {
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      <<-EOS
[section2]
foo = http://192.168.1.1:8080
      EOS
<<<<<<< HEAD
    end

    expected_content_one = <<-EOS
=======
    }

    it "should be able to add a global setting" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
           :section => '', :setting => 'foo', :value => 'yippee'))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
foo = yippee

[section2]
foo = http://192.168.1.1:8080
<<<<<<< HEAD
    EOS
    it 'is able to add a global setting' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: '', setting: 'foo', value: 'yippee'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_one, tmpfile)
    end

    expected_content_two = <<-EOS
[section2]
foo = yippee
    EOS
    it 'modifies an existing setting' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section2', setting: 'foo', value: 'yippee'))
      provider = described_class.new(resource)
      expect(provider.value).to eq('http://192.168.1.1:8080')
      provider.value = 'yippee'
      validate_file(expected_content_two, tmpfile)
    end

    expected_content_three = <<-EOS
[section2]
foo = http://192.168.1.1:8080
bar = baz
    EOS
    it 'adds a new setting' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section2', setting: 'bar', value: 'baz'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_three, tmpfile)
    end
  end

  context 'when overriding the separator' do
    let(:orig_content) do
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should modify an existing setting" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
          :section => 'section2', :setting => 'foo', :value => 'yippee'))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.value.should eq('http://192.168.1.1:8080')
      provider.value=('yippee')
      expected_content = <<-EOS
[section2]
foo = yippee
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should add a new setting" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
          :section => 'section2', :setting => 'bar', :value => 'baz'))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      expected_content = <<-EOS
[section2]
foo = http://192.168.1.1:8080
bar = baz
      EOS
      validate_file(expected_content, tmpfile)
    end
  end

  context "when overriding the separator" do
    let(:orig_content) {
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      <<-EOS
[section2]
foo=bar
      EOS
<<<<<<< HEAD
    end

    expected_content_one = <<-EOS
[section2]
foo=yippee
    EOS
    it 'modifies an existing setting' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section2', setting: 'foo', value: 'yippee', key_val_separator: '='))
      provider = described_class.new(resource)
      expect(provider.value).to eq('bar')
      provider.value = 'yippee'
      validate_file(expected_content_one, tmpfile)
    end
  end

  context 'when overriding the separator to something other than =' do
    let(:orig_content) do
=======
    }

    it "should modify an existing setting" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
                                                   :section           => 'section2',
                                                   :setting           => 'foo',
                                                   :value             => 'yippee',
                                                   :key_val_separator => '='))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.value.should eq('bar')
      provider.value=('yippee')
      expected_content = <<-EOS
[section2]
foo=yippee
      EOS
      validate_file(expected_content, tmpfile)
    end

  end

  context "when overriding the separator to something other than =" do
    let(:orig_content) {
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      <<-EOS
[section2]
foo: bar
      EOS
<<<<<<< HEAD
    end

    expected_content_one = <<-EOS
[section2]
foo: yippee
    EOS
    it 'modifies an existing setting' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section2', setting: 'foo', value: 'yippee', key_val_separator: ': '))
      provider = described_class.new(resource)
      expect(provider.value).to eq('bar')
      provider.value = 'yippee'
      validate_file(expected_content_one, tmpfile)
    end

    expected_content_two = <<-EOS
[section2]
foo: bar
bar: baz
    EOS
    it 'adds a new setting' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section2', setting: 'bar', value: 'baz', key_val_separator: ': '))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_two, tmpfile)
    end
  end

  context 'when overriding the separator to a space' do
    let(:orig_content) do
=======
    }

    it "should modify an existing setting" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
                                                   :section           => 'section2',
                                                   :setting           => 'foo',
                                                   :value             => 'yippee',
                                                   :key_val_separator => ': '))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.value.should eq('bar')
      provider.value=('yippee')
      expected_content = <<-EOS
[section2]
foo: yippee
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should add a new setting" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
                                                   :section           => 'section2',
                                                   :setting           => 'bar',
                                                   :value             => 'baz',
                                                   :key_val_separator => ': '))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      expected_content = <<-EOS
[section2]
foo: bar
bar: baz
      EOS
      validate_file(expected_content, tmpfile)
    end

  end

  context "when overriding the separator to a space" do
    let(:orig_content) {
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      <<-EOS
[section2]
foo bar
      EOS
<<<<<<< HEAD
    end

    expected_content_one = <<-EOS
[section2]
foo yippee
    EOS
    it 'modifies an existing setting' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section2', setting: 'foo', value: 'yippee', key_val_separator: ' '))
      provider = described_class.new(resource)
      expect(provider.value).to eq('bar')
      provider.value = 'yippee'
      validate_file(expected_content_one, tmpfile)
    end

    expected_content_two = <<-EOS
[section2]
foo bar
bar baz
    EOS
    it 'adds a new setting' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section2', setting: 'bar', value: 'baz', key_val_separator: ' '))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_two, tmpfile)
    end
  end

  context 'when ensuring that a setting is absent' do
    let(:orig_content) do
=======
    }

    it "should modify an existing setting" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
                                                   :section           => 'section2',
                                                   :setting           => 'foo',
                                                   :value             => 'yippee',
                                                   :key_val_separator => ' '))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.value.should eq('bar')
      provider.value=('yippee')
      expected_content = <<-EOS
[section2]
foo yippee
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should add a new setting" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
                                                   :section           => 'section2',
                                                   :setting           => 'bar',
                                                   :value             => 'baz',
                                                   :key_val_separator => ' '))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      expected_content = <<-EOS
[section2]
foo bar
bar baz
      EOS
      validate_file(expected_content, tmpfile)
    end
  end

  context "when ensuring that a setting is absent" do
    let(:orig_content) {
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      <<-EOS
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section3]
# com = ment
uncom = ment
[section4]
uncom = ment
[section:sub]
subby=bar
    #another comment
 ; yet another comment

 -nonstandard-
   shoes = purple
EOS
<<<<<<< HEAD
    end

    expected_content_one = <<-EOS
=======
    }

    it "should remove a setting that exists" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
      :section => 'section1', :setting => 'foo', :ensure => 'absent'))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.destroy
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
[section1]
; This is also a comment

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section3]
# com = ment
uncom = ment
[section4]
uncom = ment
[section:sub]
subby=bar
    #another comment
 ; yet another comment

 -nonstandard-
   shoes = purple
<<<<<<< HEAD
    EOS
    it 'removes a setting that exists' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section1', setting: 'foo', ensure: 'absent'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be true
      provider.destroy
      validate_file(expected_content_one, tmpfile)
    end

    expected_content_two = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should remove a setting with pre/suffix that exists" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
      :section => 'nonstandard', :setting => 'shoes', :ensure => 'absent',
      :section_prefix => '-', :section_suffix => '-' ))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.destroy
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section3]
# com = ment
uncom = ment
[section4]
uncom = ment
[section:sub]
subby=bar
    #another comment
 ; yet another comment

    EOS
<<<<<<< HEAD
    it 'removes a setting with pre/suffix that exists' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'nonstandard', setting: 'shoes', ensure: 'absent', section_prefix: '-', section_suffix: '-'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be true
      provider.destroy
      validate_file(expected_content_two, tmpfile)
    end

    expected_content_three = <<-EOS
=======
    validate_file(expected_content, tmpfile)
    end

    it "should do nothing for a setting that does not exist" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
                                                   :section => 'section:sub', :setting => 'foo', :ensure => 'absent'))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.destroy
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section3]
# com = ment
uncom = ment
[section4]
uncom = ment
[section:sub]
subby=bar
    #another comment
 ; yet another comment

 -nonstandard-
   shoes = purple
<<<<<<< HEAD
    EOS
    it 'does nothing for a setting that does not exist' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section:sub', setting: 'foo', ensure: 'absent'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.destroy
      validate_file(expected_content_three, tmpfile)
    end

    expected_content_four = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should do nothing for a setting with pre/suffix that does not exist" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
         :section => 'nonstandard', :setting => 'foo', :ensure => 'absent',
         :section_prefix => '-', :section_suffix => '-' ))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.destroy
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section3]
# com = ment
uncom = ment
[section4]
uncom = ment
[section:sub]
subby=bar
    #another comment
 ; yet another comment

 -nonstandard-
   shoes = purple
<<<<<<< HEAD
    EOS
    it 'does nothing for a setting with pre/suffix that does not exist' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'nonstandard', setting: 'foo', ensure: 'absent', section_prefix: '-', section_suffix: '-'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.destroy
      validate_file(expected_content_four, tmpfile)
    end

    expected_content_five = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "does not remove a section when the last uncommented setting is removed if there are comments" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
        :section => 'section3',
        :setting => 'uncom',
        :ensure => 'absent',
      ))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.destroy
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section3]
# com = ment
[section4]
uncom = ment
[section:sub]
subby=bar
    #another comment
 ; yet another comment

 -nonstandard-
   shoes = purple
<<<<<<< HEAD
    EOS
    it 'does not remove a section when the last uncommented setting is removed if there are comments' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section3', setting: 'uncom', ensure: 'absent'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be true
      provider.destroy
      validate_file(expected_content_five, tmpfile)
    end

    expected_content_six = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "removes the section when removing the last line in the section" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
        :section => 'section4',
        :setting => 'uncom',
        :ensure => 'absent',
      ))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.destroy
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section2]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section3]
# com = ment
uncom = ment
[section:sub]
subby=bar
    #another comment
 ; yet another comment

 -nonstandard-
   shoes = purple
<<<<<<< HEAD
    EOS
    it 'removes the section when removing the last line in the section' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section4', setting: 'uncom', ensure: 'absent'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be true
      provider.destroy
      validate_file(expected_content_six, tmpfile)
    end
  end

  context 'when dealing with indentation in sections' do
    let(:orig_content) do
=======
      EOS
      validate_file(expected_content, tmpfile)
    end
  end

  context "when dealing with indentation in sections" do
    let(:orig_content) {
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      <<-EOS
# This is a comment
     [section1]
     ; This is also a comment
     foo=foovalue

     bar = barvalue
     master = true

[section2]
  foo= foovalue2
  baz=bazvalue
  url = http://192.168.1.1:8080
[section:sub]
 subby=bar
    #another comment
  fleezy = flam
 ; yet another comment
      EOS
<<<<<<< HEAD
    end

    expected_content_one = <<-EOS
=======
    }

    it "should add a missing setting at the correct indentation when the header is aligned" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
                    :section => 'section1', :setting => 'yahoo', :value => 'yippee'))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
     [section1]
     ; This is also a comment
     foo=foovalue

     bar = barvalue
     master = true
     yahoo = yippee

[section2]
  foo= foovalue2
  baz=bazvalue
  url = http://192.168.1.1:8080
[section:sub]
 subby=bar
    #another comment
  fleezy = flam
 ; yet another comment
<<<<<<< HEAD
    EOS
    it 'adds a missing setting at the correct indentation when the header is aligned' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section1', setting: 'yahoo', value: 'yippee'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_one, tmpfile)
    end

    expected_content_two = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should update an existing setting at the correct indentation when the header is aligned" do
      resource = Puppet::Type::Ini_setting.new(
          common_params.merge(:section => 'section1', :setting => 'bar', :value => 'barvalue2'))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
     [section1]
     ; This is also a comment
     foo=foovalue

     bar = barvalue2
     master = true

[section2]
  foo= foovalue2
  baz=bazvalue
  url = http://192.168.1.1:8080
[section:sub]
 subby=bar
    #another comment
  fleezy = flam
 ; yet another comment
<<<<<<< HEAD
    EOS
    it 'updates an existing setting at the correct indentation when the header is aligned' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section1', setting: 'bar', value: 'barvalue2'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be true
      provider.create
      validate_file(expected_content_two, tmpfile)
    end

    expected_content_three = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should add a missing setting at the correct indentation when the header is not aligned" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
                                                   :section => 'section2', :setting => 'yahoo', :value => 'yippee'))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
     [section1]
     ; This is also a comment
     foo=foovalue

     bar = barvalue
     master = true

[section2]
  foo= foovalue2
  baz=bazvalue
  url = http://192.168.1.1:8080
  yahoo = yippee
[section:sub]
 subby=bar
    #another comment
  fleezy = flam
 ; yet another comment
<<<<<<< HEAD
    EOS
    it 'adds a missing setting at the correct indentation when the header is not aligned' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section2', setting: 'yahoo', value: 'yippee'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_three, tmpfile)
    end

    expected_content_four = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should update an existing setting at the correct indentation when the header is not aligned" do
      resource = Puppet::Type::Ini_setting.new(
          common_params.merge(:section => 'section2', :setting => 'baz', :value => 'bazvalue2'))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
     [section1]
     ; This is also a comment
     foo=foovalue

     bar = barvalue
     master = true

[section2]
  foo= foovalue2
  baz=bazvalue2
  url = http://192.168.1.1:8080
[section:sub]
 subby=bar
    #another comment
  fleezy = flam
 ; yet another comment
<<<<<<< HEAD
    EOS
    it 'updates an existing setting at the correct indentation when the header is not aligned' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section2', setting: 'baz', value: 'bazvalue2'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be true
      provider.create
      validate_file(expected_content_four, tmpfile)
    end

    expected_content_five = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should add a missing setting at the min indentation when the section is not aligned" do
      resource = Puppet::Type::Ini_setting.new(
          common_params.merge(:section => 'section:sub', :setting => 'yahoo', :value => 'yippee'))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
     [section1]
     ; This is also a comment
     foo=foovalue

     bar = barvalue
     master = true

[section2]
  foo= foovalue2
  baz=bazvalue
  url = http://192.168.1.1:8080
[section:sub]
 subby=bar
    #another comment
  fleezy = flam
 ; yet another comment
 yahoo = yippee
<<<<<<< HEAD
    EOS
    it 'adds a missing setting at the min indentation when the section is not aligned' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section:sub', setting: 'yahoo', value: 'yippee'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_five, tmpfile)
    end

    expected_content_six = <<-EOS
# This is a comment
     [section1]
     ; This is also a comment
     foo=foovalue

     bar = barvalue
     master = true

[section2]
  foo= foovalue2
  baz=bazvalue
  url = http://192.168.1.1:8080
[section:sub]
 subby=bar
    #another comment
  fleezy = flam2
 ; yet another comment
    EOS
    it 'updates an existing setting at the previous indentation when the section is not aligned' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section:sub', setting: 'fleezy', value: 'flam2'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be true
      provider.create
      validate_file(expected_content_six, tmpfile)
    end

    expected_content_seven = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should update an existing setting at the previous indentation when the section is not aligned" do
      resource = Puppet::Type::Ini_setting.new(
          common_params.merge(:section => 'section:sub', :setting => 'fleezy', :value => 'flam2'))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
     [section1]
     ; This is also a comment
     foo=foovalue

     bar = barvalue
     master = true

[section2]
  foo= foovalue2
  baz=bazvalue
  url = http://192.168.1.1:8080
[section:sub]
 subby=bar
    #another comment
  fleezy = flam2
 ; yet another comment
<<<<<<< HEAD
    EOS
    it 'updates an existing setting at the previous indentation regardless of indent_char and indent_width settings' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section:sub', setting: 'fleezy', value: 'flam2', indent_char: 'ignore this', indent_width: 10))
      provider = described_class.new(resource)
      expect(provider.exists?).to be true
      provider.create
      validate_file(expected_content_seven, tmpfile)
    end
  end

  context 'when dealing settings that have a commented version present' do
    let(:orig_content) do
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

  end


  context "when dealing settings that have a commented version present" do
    let(:orig_content) {
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      <<-EOS
     [section1]
     # foo=foovalue
     bar=barvalue
     foo = foovalue2

[section2]
# foo = foovalue
;bar=barvalue
blah = blah
#baz=
      EOS
<<<<<<< HEAD
    end

    expected_content_eight = <<-EOS
=======
    }

    it "should add a new setting below a commented version of that setting" do
      resource = Puppet::Type::Ini_setting.new(
          common_params.merge(:section => 'section2', :setting => 'foo', :value => 'foo3'))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
     [section1]
     # foo=foovalue
     bar=barvalue
     foo = foovalue2

[section2]
# foo = foovalue
foo = foo3
;bar=barvalue
blah = blah
#baz=
<<<<<<< HEAD
    EOS
    it 'adds a new setting below a commented version of that setting' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section2', setting: 'foo', value: 'foo3'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_eight, tmpfile)
    end

    expected_content_nine = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should update an existing setting in place, even if there is a commented version of that setting" do
      resource = Puppet::Type::Ini_setting.new(
          common_params.merge(:section => 'section1', :setting => 'foo', :value => 'foo3'))
      provider = described_class.new(resource)
      provider.exists?.should be true
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
     [section1]
     # foo=foovalue
     bar=barvalue
     foo = foo3

[section2]
# foo = foovalue
;bar=barvalue
blah = blah
#baz=
<<<<<<< HEAD
    EOS
    it 'updates an existing setting in place, even if there is a commented version of that setting' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section1', setting: 'foo', value: 'foo3'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be true
      provider.create
      validate_file(expected_content_nine, tmpfile)
    end

    expected_content_ten = <<-EOS
=======
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should add a new setting below a commented version of that setting, respecting semicolons as comments" do
      resource = Puppet::Type::Ini_setting.new(
          common_params.merge(:section => 'section2', :setting => 'bar', :value => 'bar3'))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
     [section1]
     # foo=foovalue
     bar=barvalue
     foo = foovalue2

[section2]
# foo = foovalue
;bar=barvalue
<<<<<<< HEAD
bar = bar3
blah = blah
#baz=
    EOS
    it 'adds a new setting below a commented version of that setting, respecting semicolons as comments' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section2', setting: 'bar', value: 'bar3'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_ten, tmpfile)
    end

    expected_content_four = <<-EOS
=======
bar=bar3
blah = blah
#baz=
      EOS
      validate_file(expected_content, tmpfile)
    end

    it "should add a new setting below an empty commented version of that setting" do
      resource = Puppet::Type::Ini_setting.new(
          common_params.merge(:section => 'section2', :setting => 'baz', :value => 'bazvalue'))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
     [section1]
     # foo=foovalue
     bar=barvalue
     foo = foovalue2

[section2]
# foo = foovalue
;bar=barvalue
blah = blah
#baz=
<<<<<<< HEAD
baz = bazvalue
    EOS
    it 'adds a new setting below an empty commented version of that setting' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section2', setting: 'baz', value: 'bazvalue'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_four, tmpfile)
    end

    context 'when a section only contains comments' do
      let(:orig_content) do
        <<-EOS
=======
baz=bazvalue
      EOS
      validate_file(expected_content, tmpfile)
    end

    context 'when a section only contains comments' do
     let(:orig_content) {
      <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
[section1]
# foo=foovalue
# bar=bar2
EOS
<<<<<<< HEAD
      end

      expected_content_one = <<-EOS
[section1]
# foo=foovalue
foo = foovalue2
# bar=bar2
      EOS
      it 'is able to add a new setting when a section contains only comments' do
        resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section1', setting: 'foo', value: 'foovalue2'))
        provider = described_class.new(resource)
        expect(provider.exists?).to be false
        provider.create
        validate_file(expected_content_one, tmpfile)
      end

      expected_content_two = <<-EOS
[section1]
# foo=foovalue
# bar=bar2
bar = barvalue2
      EOS
      it 'is able to add a new setting when it matches a commented out line other than the first one' do
        resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section1', setting: 'bar', value: 'barvalue2'))
        provider = described_class.new(resource)
        expect(provider.exists?).to be false
        provider.create
        validate_file(expected_content_two, tmpfile)
      end
    end

    context 'when sections have spaces and dashes' do
      let(:orig_content) do
=======
    }

      it 'should be able to add a new setting when a section contains only comments' do
        resource = Puppet::Type::Ini_setting.new(
          common_params.merge(:section => 'section1', :setting => 'foo', :value => 'foovalue2')
        )
        provider = described_class.new(resource)
        provider.exists?.should be false
        provider.create
        expected_content = <<-EOS
[section1]
# foo=foovalue
foo=foovalue2
# bar=bar2
        EOS
        validate_file(expected_content, tmpfile)
      end

      it 'should be able to add a new setting when it matches a commented out line other than the first one' do
        resource = Puppet::Type::Ini_setting.new(
          common_params.merge(:section => 'section1', :setting => 'bar', :value => 'barvalue2')
        )
        provider = described_class.new(resource)
        provider.exists?.should be false
        provider.create
        expected_content = <<-EOS
[section1]
# foo=foovalue
# bar=bar2
bar=barvalue2
        EOS
        validate_file(expected_content, tmpfile)
      end
    end

    context "when sections have spaces and dashes" do
      let(:orig_content) {
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
        <<-EOS
# This is a comment
[section - one]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section - two]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
[section:sub]
subby=bar
    #another comment
 ; yet another comment
        EOS
<<<<<<< HEAD
      end

      expected_content_one = <<-EOS
=======
      }

      it "should add a missing setting to the correct section" do
        resource = Puppet::Type::Ini_setting.new(common_params.merge(
            :section => 'section - two', :setting => 'yahoo', :value => 'yippee'))
        provider = described_class.new(resource)
        provider.exists?.should be false
        provider.create
        expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# This is a comment
[section - one]
; This is also a comment
foo=foovalue

bar = barvalue
master = true
[section - two]

foo= foovalue2
baz=bazvalue
url = http://192.168.1.1:8080
yahoo = yippee
[section:sub]
subby=bar
    #another comment
 ; yet another comment
<<<<<<< HEAD
      EOS
      it 'adds a missing setting to the correct section' do
        resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'section - two', setting: 'yahoo', value: 'yippee'))
        provider = described_class.new(resource)
        expect(provider.exists?).to be false
        provider.create
        validate_file(expected_content_one, tmpfile)
      end
    end
  end

  context 'when sections have spaces and quotations' do
=======
        EOS
        validate_file(expected_content, tmpfile)
      end

    end

  end

  context "when sections have spaces and quotations" do
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    let(:orig_content) do
      <<-EOS
[branch "master"]
        remote = origin
        merge = refs/heads/master

[alias]
to-deploy = log --merges --grep='pull request' --format='%s (%cN)' origin/production..origin/master
[branch "production"]
        remote = origin
        merge = refs/heads/production
      EOS
    end

<<<<<<< HEAD
    expected_content_one = <<-EOS
=======
    it "should add a missing setting to the correct section" do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(
        :section => 'alias',
        :setting => 'foo',
        :value => 'bar'
      ))
      provider = described_class.new(resource)
      provider.exists?.should be false
      provider.create
      expected_content = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
[branch "master"]
        remote = origin
        merge = refs/heads/master

[alias]
to-deploy = log --merges --grep='pull request' --format='%s (%cN)' origin/production..origin/master
foo = bar
[branch "production"]
        remote = origin
        merge = refs/heads/production
<<<<<<< HEAD
    EOS
    it 'adds a missing setting to the correct section' do
      resource = Puppet::Type::Ini_setting.new(common_params.merge(section: 'alias', setting: 'foo', value: 'bar'))
      provider = described_class.new(resource)
      expect(provider.exists?).to be false
      provider.create
      validate_file(expected_content_one, tmpfile)
    end
  end
  # rubocop:enable Layout/IndentHeredoc
=======
      EOS
      validate_file(expected_content, tmpfile)
    end
  end
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
end
