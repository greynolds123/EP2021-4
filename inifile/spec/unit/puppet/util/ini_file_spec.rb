require 'spec_helper'
require 'stringio'
require 'puppet/util/ini_file'

describe Puppet::Util::IniFile do
<<<<<<< HEAD
  subject(:ini_sub) { described_class.new('/my/ini/file/path') }

  before :each do
    allow(File).to receive(:file?).with('/my/ini/file/path') { true }
    allow(described_class).to receive(:readlines).once.with('/my/ini/file/path') do
=======
  let(:subject) { Puppet::Util::IniFile.new("/my/ini/file/path") }

  before :each do
    File.should_receive(:file?).with("/my/ini/file/path") { true }
    described_class.should_receive(:readlines).once.with("/my/ini/file/path") do
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      sample_content
    end
  end

<<<<<<< HEAD
  context 'when parsing a file' do
    let(:sample_content) do
      template = <<-EOS
        # This is a comment
        [section1]
        ; This is also a comment
        foo=foovalue

        bar = barvalue
        baz =
        [section2]

        foo= foovalue2
        baz=bazvalue
         ; commented = out setting
            #another comment
         ; yet another comment
         zot = multi word value
         xyzzy['thing1']['thing2']=xyzzyvalue
         l=git log
      EOS
      template.split("\n")
    end

    it 'parses the correct number of sections' do
      # there is always a "global" section, so our count should be 3.
      expect(ini_sub.section_names.length).to eq(3)
    end

    it 'parses the correct section_names' do
      # there should always be a "global" section named "" at the beginning of the list
      expect(ini_sub.section_names).to eq(['', 'section1', 'section2'])
    end

    it 'exposes settings for sections #section1' do
      expect(ini_sub.get_settings('section1')).to eq('bar' => 'barvalue',
                                                     'baz' => '',
                                                     'foo' => 'foovalue')
    end
    it 'exposes settings for sections #section2' do
      expect(ini_sub.get_settings('section2')).to eq('baz' => 'bazvalue',
                                                     'foo' => 'foovalue2',
                                                     'l' => 'git log',
                                                     "xyzzy['thing1']['thing2']" => 'xyzzyvalue',
                                                     'zot' => 'multi word value')
    end
  end

  context 'when parsing a file whose first line is a section' do
    let(:sample_content) do
      template = <<-EOS
        [section1]
        ; This is a comment
        foo=foovalue
      EOS
      template.split("\n")
    end

    it 'parses the correct number of sections' do
      # there is always a "global" section, so our count should be 2.
      expect(ini_sub.section_names.length).to eq(2)
    end

    it 'parses the correct section_names' do
      # there should always be a "global" section named "" at the beginning of the list
      expect(ini_sub.section_names).to eq(['', 'section1'])
    end

    it 'exposes settings for sections' do
      expect(ini_sub.get_value('section1', 'foo')).to eq('foovalue')
    end
  end

  context "when parsing a file with a 'global' section" do
    let(:sample_content) do
      template = <<-EOS
        foo = bar
        [section1]
        ; This is a comment
        foo=foovalue
      EOS
      template.split("\n")
    end

    it 'parses the correct number of sections' do
      # there is always a "global" section, so our count should be 2.
      expect(ini_sub.section_names.length).to eq(2)
    end

    it 'parses the correct section_names' do
      # there should always be a "global" section named "" at the beginning of the list
      expect(ini_sub.section_names).to eq(['', 'section1'])
    end

    it 'exposes settings for sections #bar' do
      expect(ini_sub.get_value('', 'foo')).to eq('bar')
    end
    it 'exposes settings for sections #foovalue' do
      expect(ini_sub.get_value('section1', 'foo')).to eq('foovalue')
    end
  end

  context 'when updating a file with existing empty values' do
    let(:sample_content) do
      template = <<-EOS
        [section1]
        foo=
        #bar=
        #xyzzy['thing1']['thing2']='xyzzyvalue'
      EOS
      template.split("\n")
    end

    # rubocop:disable RSpec/ExpectInHook
    before :each do
      expect(ini_sub.get_value('section1', 'far')).to eq(nil)
      expect(ini_sub.get_value('section1', 'bar')).to eq(nil)
      expect(ini_sub.get_value('section1', "xyzzy['thing1']['thing2']")).to eq(nil)
    end
    # rubocop:enable RSpec/ExpectInHook

    it 'properlies update uncommented values' do
      ini_sub.set_value('section1', 'foo', ' = ', 'foovalue')
      expect(ini_sub.get_value('section1', 'foo')).to eq('foovalue')
    end

    it 'properlies update uncommented values without separator' do
      ini_sub.set_value('section1', 'foo', 'foovalue')
      expect(ini_sub.get_value('section1', 'foo')).to eq('foovalue')
    end

    it 'properlies update commented value' do
      ini_sub.set_value('section1', 'bar', ' = ', 'barvalue')
      expect(ini_sub.get_value('section1', 'bar')).to eq('barvalue')
    end

    it 'properlies update commented values' do
      ini_sub.set_value('section1', "xyzzy['thing1']['thing2']", ' = ', 'xyzzyvalue')
      expect(ini_sub.get_value('section1', "xyzzy['thing1']['thing2']")).to eq('xyzzyvalue')
    end

    it 'properlies update commented value without separator' do
      ini_sub.set_value('section1', 'bar', 'barvalue')
      expect(ini_sub.get_value('section1', 'bar')).to eq('barvalue')
    end

    it 'properlies update commented values without separator' do
      ini_sub.set_value('section1', "xyzzy['thing1']['thing2']", 'xyzzyvalue')
      expect(ini_sub.get_value('section1', "xyzzy['thing1']['thing2']")).to eq('xyzzyvalue')
    end

    it 'properlies add new empty values' do
      ini_sub.set_value('section1', 'baz', ' = ', 'bazvalue')
      expect(ini_sub.get_value('section1', 'baz')).to eq('bazvalue')
    end

    it 'adds new empty values without separator' do
      ini_sub.set_value('section1', 'baz', 'bazvalue')
      expect(ini_sub.get_value('section1', 'baz')).to eq('bazvalue')
=======
  context "when parsing a file" do
    let(:sample_content) {
      template = <<-EOS
# This is a comment
[section1]
; This is also a comment
foo=foovalue

bar = barvalue
baz =
[section2]

foo= foovalue2
baz=bazvalue
 ; commented = out setting
    #another comment
 ; yet another comment
 zot = multi word value
 xyzzy['thing1']['thing2']=xyzzyvalue
 l=git log
      EOS
      template.split("\n")
    }

    it "should parse the correct number of sections" do
      # there is always a "global" section, so our count should be 3.
      subject.section_names.length.should == 3
    end

    it "should parse the correct section_names" do
      # there should always be a "global" section named "" at the beginning of the list
      subject.section_names.should == ["", "section1", "section2"]
    end

    it "should expose settings for sections" do
      subject.get_settings("section1").should == {
        "bar" => "barvalue",
        "baz" => "",
        "foo" => "foovalue"
      }

      subject.get_settings("section2").should == {
        "baz" => "bazvalue",
        "foo" => "foovalue2",
        "l" => "git log",
        "xyzzy['thing1']['thing2']" => "xyzzyvalue",
        "zot" => "multi word value"
      }
    end

  end

  context "when parsing a file whose first line is a section" do
    let(:sample_content) {
      template = <<-EOS
[section1]
; This is a comment
foo=foovalue
      EOS
      template.split("\n")
    }

    it "should parse the correct number of sections" do
      # there is always a "global" section, so our count should be 2.
      subject.section_names.length.should == 2
    end

    it "should parse the correct section_names" do
      # there should always be a "global" section named "" at the beginning of the list
      subject.section_names.should == ["", "section1"]
    end

    it "should expose settings for sections" do
      subject.get_value("section1", "foo").should == "foovalue"
    end

  end

  context "when parsing a file with a 'global' section" do
    let(:sample_content) {
      template = <<-EOS
foo = bar
[section1]
; This is a comment
foo=foovalue
      EOS
      template.split("\n")
    }

    it "should parse the correct number of sections" do
      # there is always a "global" section, so our count should be 2.
      subject.section_names.length.should == 2
    end

    it "should parse the correct section_names" do
      # there should always be a "global" section named "" at the beginning of the list
      subject.section_names.should == ["", "section1"]
    end

    it "should expose settings for sections" do
      subject.get_value("", "foo").should == "bar"
      subject.get_value("section1", "foo").should == "foovalue"
    end
  end

  context "when updating a file with existing empty values" do
    let(:sample_content) {
      template = <<-EOS
[section1]
foo=
#bar=
#xyzzy['thing1']['thing2']='xyzzyvalue'
      EOS
      template.split("\n")
    }

    it "should properly update uncommented values" do
      subject.get_value("section1", "far").should == nil
      subject.set_value("section1", "foo", "foovalue")
      subject.get_value("section1", "foo").should == "foovalue"
    end

    it "should properly update commented values" do
      subject.get_value("section1", "bar").should == nil
      subject.set_value("section1", "bar", "barvalue")
      subject.get_value("section1", "bar").should == "barvalue"
      subject.get_value("section1", "xyzzy['thing1']['thing2']").should == nil
      subject.set_value("section1", "xyzzy['thing1']['thing2']", "xyzzyvalue")
      subject.get_value("section1", "xyzzy['thing1']['thing2']").should == "xyzzyvalue"
    end

    it "should properly add new empty values" do
      subject.get_value("section1", "baz").should == nil
      subject.set_value("section1", "baz", "bazvalue")
      subject.get_value("section1", "baz").should == "bazvalue"
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    end
  end

  context 'the file has quotation marks in its section names' do
    let(:sample_content) do
      template = <<-EOS
<<<<<<< HEAD
        [branch "master"]
                remote = origin
                merge = refs/heads/master

        [alias]
        to-deploy = log --merges --grep='pull request' --format='%s (%cN)' origin/production..origin/master
        [branch "production"]
                remote = origin
                merge = refs/heads/production
=======
[branch "master"]
        remote = origin
        merge = refs/heads/master

[alias]
to-deploy = log --merges --grep='pull request' --format='%s (%cN)' origin/production..origin/master
[branch "production"]
        remote = origin
        merge = refs/heads/production
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      EOS
      template.split("\n")
    end

<<<<<<< HEAD
    it 'parses the sections' do
      expect(ini_sub.section_names).to match_array ['',
                                                    'branch "master"',
                                                    'alias',
                                                    'branch "production"']
=======
    it 'should parse the sections' do
      subject.section_names.should match_array ['',
                                                'branch "master"',
                                                'alias',
                                                'branch "production"'
      ]
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    end
  end

  context 'Samba INI file with dollars in section names' do
    let(:sample_content) do
      template = <<-EOS
<<<<<<< HEAD
        [global]
          workgroup = FELLOWSHIP
          ; ...
          idmap config * : backend = tdb

        [printers]
          comment = All Printers
          ; ...
          browseable = No

        [print$]
          comment = Printer Drivers
          path = /var/lib/samba/printers

        [Shares]
          path = /home/shares
          read only = No
          guest ok = Yes
=======
      [global]
        workgroup = FELLOWSHIP
        ; ...
        idmap config * : backend = tdb

      [printers]
        comment = All Printers
        ; ...
        browseable = No

      [print$]
        comment = Printer Drivers
        path = /var/lib/samba/printers

      [Shares]
        path = /home/shares
        read only = No
        guest ok = Yes
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      EOS
      template.split("\n")
    end

<<<<<<< HEAD
    it 'parses the correct section_names' do
      expect(ini_sub.section_names).to match_array ['', 'global', 'printers', 'print$', 'Shares']
=======
    it "should parse the correct section_names" do
      subject.section_names.should match_array [
        '',
        'global',
        'printers',
        'print$',
        'Shares'
      ]
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    end
  end

  context 'section names with forward slashes in them' do
    let(:sample_content) do
      template = <<-EOS
<<<<<<< HEAD
        [monitor:///var/log/*.log]
        disabled = test_value
=======
[monitor:///var/log/*.log]
disabled = test_value
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      EOS
      template.split("\n")
    end

<<<<<<< HEAD
    it 'parses the correct section_names' do
      expect(ini_sub.section_names).to match_array [
        '',
        'monitor:///var/log/*.log',
=======
    it "should parse the correct section_names" do
      subject.section_names.should match_array [
        '',
        'monitor:///var/log/*.log'
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      ]
    end
  end

  context 'KDE Configuration with braces in setting names' do
    let(:sample_content) do
      template = <<-EOS
<<<<<<< HEAD
              [khotkeys]
        _k_friendly_name=khotkeys
        {5465e8c7-d608-4493-a48f-b99d99fdb508}=Print,none,PrintScreen
        {d03619b6-9b3c-48cc-9d9c-a2aadb485550}=Search,none,Search
      EOS
      template.split("\n")
    end

    it 'exposes settings for sections #print' do
      expect(ini_sub.get_value('khotkeys', '{5465e8c7-d608-4493-a48f-b99d99fdb508}')).to eq('Print,none,PrintScreen')
    end
    it 'exposes settings for sections #search' do
      expect(ini_sub.get_value('khotkeys', '{d03619b6-9b3c-48cc-9d9c-a2aadb485550}')).to eq('Search,none,Search')
=======
      [khotkeys]
_k_friendly_name=khotkeys
{5465e8c7-d608-4493-a48f-b99d99fdb508}=Print,none,PrintScreen
{d03619b6-9b3c-48cc-9d9c-a2aadb485550}=Search,none,Search
EOS
      template.split("\n")
    end

    it "should expose settings for sections" do
      subject.get_value("khotkeys", "{5465e8c7-d608-4493-a48f-b99d99fdb508}").should == "Print,none,PrintScreen"
      subject.get_value("khotkeys", "{d03619b6-9b3c-48cc-9d9c-a2aadb485550}").should == "Search,none,Search"
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    end
  end

  context 'Configuration with colons in setting names' do
    let(:sample_content) do
      template = <<-EOS
<<<<<<< HEAD
              [Drive names]
        A:=5.25" Floppy
        B:=3.5" Floppy
        C:=Winchester
      EOS
      template.split("\n")
    end

    it 'exposes settings for sections #A' do
      expect(ini_sub.get_value('Drive names', 'A:')).to eq '5.25" Floppy'
    end
    it 'exposes settings for sections #B' do
      expect(ini_sub.get_value('Drive names', 'B:')).to eq '3.5" Floppy'
    end
    it 'exposes settings for sections #C' do
      expect(ini_sub.get_value('Drive names', 'C:')).to eq 'Winchester'
=======
      [Drive names]
A:=5.25" Floppy
B:=3.5" Floppy
C:=Winchester
EOS
      template.split("\n")
    end

    it "should expose settings for sections" do
      subject.get_value("Drive names", "A:").should eq '5.25" Floppy'
      subject.get_value("Drive names", "B:").should eq '3.5" Floppy'
      subject.get_value("Drive names", "C:").should eq 'Winchester'
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    end
  end

  context 'Configuration with spaces in setting names' do
    let(:sample_content) do
      template = <<-EOS
<<<<<<< HEAD
        [global]
          # log files split per-machine:
          log file = /var/log/samba/log.%m

          kerberos method = system keytab
          passdb backend = tdbsam
          security = ads
      EOS
      template.split("\n")
    end

    it 'exposes settings for sections #log' do
      expect(ini_sub.get_value('global', 'log file')).to eq '/var/log/samba/log.%m'
    end
    it 'exposes settings for sections #kerberos' do
      expect(ini_sub.get_value('global', 'kerberos method')).to eq 'system keytab'
    end
    it 'exposes settings for sections #passdb' do
      expect(ini_sub.get_value('global', 'passdb backend')).to eq 'tdbsam'
    end
    it 'exposes settings for sections #security' do
      expect(ini_sub.get_value('global', 'security')).to eq 'ads'
=======
      [global]
        # log files split per-machine:
        log file = /var/log/samba/log.%m

        kerberos method = system keytab
        passdb backend = tdbsam
        security = ads
EOS
      template.split("\n")
    end

    it "should expose settings for sections" do
      subject.get_value("global", "log file").should eq '/var/log/samba/log.%m'
      subject.get_value("global", "kerberos method").should eq 'system keytab'
      subject.get_value("global", "passdb backend").should eq 'tdbsam'
      subject.get_value("global", "security").should eq 'ads'
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    end
  end
end
