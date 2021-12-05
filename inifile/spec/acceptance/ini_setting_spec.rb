require 'spec_helper_acceptance'

<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
tmpdir = default.tmpdir('tmp')

>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
describe 'ini_setting resource' do
  basedir = setup_test_directory

  after :all do
<<<<<<< HEAD
    run_shell("rm #{basedir}/*.ini", expect_failures: true)
=======
    shell("rm #{tmpdir}/*.ini", acceptable_exit_codes: [0, 1, 2])
=======
describe 'ini_setting resource' do
  basedir = setup_test_directory

  after :all do
    run_shell("rm #{basedir}/*.ini", expect_failures: true)
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
tmpdir = default.tmpdir('tmp')

describe 'ini_setting resource' do
  after :all do
    shell("rm #{tmpdir}/*.ini", :acceptable_exit_codes => [0, 1, 2])
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
  end

  shared_examples 'has_content' do |path, pp, content|
    before :all do
<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
      shell("rm #{path}", acceptable_exit_codes: [0, 1, 2])
    end

    it 'applies the manifest twice' do
      idempotent_apply(default, pp, {})
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
      run_shell("rm #{path}", expect_failures: true)
    end

    it 'applies the manifest twice' do
      idempotent_apply(pp)
<<<<<<< HEAD
=======
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
    end

    describe file(path) do
      it { is_expected.to be_file }

      describe '#content' do
        subject { super().content }

        it { is_expected.to match content }
      end
=======
      shell("rm #{path}", :acceptable_exit_codes => [0, 1, 2])
    end
    after :all do
      shell("cat #{path}", :acceptable_exit_codes => [0, 1, 2])
      shell("rm #{path}", :acceptable_exit_codes => [0, 1, 2])
    end

    it 'applies the manifest twice' do
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe file(path) do
      it { should be_file }
      its(:content) { should match content }
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    end
  end

  shared_examples 'has_error' do |path, pp, error|
    before :all do
<<<<<<< HEAD
<<<<<<< HEAD
      run_shell("rm #{path}", expect_failures: true)
=======
<<<<<<< HEAD
      shell("rm #{path}", acceptable_exit_codes: [0, 1, 2])
=======
      run_shell("rm #{path}", expect_failures: true)
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
    end

    it 'applies the manifest and gets a failure message' do
      expect(apply_manifest(pp, expect_failures: true).stderr).to match(error)
    end

    describe file(path) do
      it { is_expected.not_to be_file }
    end
  end

  context 'ensure parameter => present for global and section' do
    pp = <<-EOS
    ini_setting { 'ensure => present for section':
      ensure  => present,
<<<<<<< HEAD
      path    => "#{basedir}/ini_setting.ini",
=======
<<<<<<< HEAD
      path    => "#{tmpdir}/ini_setting.ini",
=======
      path    => "#{basedir}/ini_setting.ini",
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
      section => 'one',
      setting => 'two',
      value   => 'three',
    }
    ini_setting { 'ensure => present for global':
      ensure  => present,
<<<<<<< HEAD
      path    => "#{basedir}/ini_setting.ini",
=======
<<<<<<< HEAD
      path    => "#{tmpdir}/ini_setting.ini",
=======
      path    => "#{basedir}/ini_setting.ini",
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
      section => '',
      setting => 'four',
      value   => 'five',
    }
    EOS

<<<<<<< HEAD
    it_behaves_like 'has_content', "#{basedir}/ini_setting.ini", pp, %r{four = five\R\R\[one\]\Rtwo = three}
=======
<<<<<<< HEAD
    it_behaves_like 'has_content', "#{tmpdir}/ini_setting.ini", pp, %r{four = five\n\n\[one\]\ntwo = three}
=======
    it_behaves_like 'has_content', "#{basedir}/ini_setting.ini", pp, %r{four = five\R\R\[one\]\Rtwo = three}
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
  end

  context 'ensure parameter => absent for key/value' do
    before :all do
<<<<<<< HEAD
=======
<<<<<<< HEAD
      ini = <<-EOS
        four = five
        [one]
        two = three
        EOS
      create_remote_file(default, File.join(tmpdir, 'ini_setting.ini'), ini)
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
      ipp = <<-MANIFEST
        file { '#{basedir}/ini_setting.ini':
          content => "four = five \n [one] \n two = three",
          force   => true,
        }
      MANIFEST

      apply_manifest(ipp)
<<<<<<< HEAD
=======
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
    end

    pp = <<-EOS
    ini_setting { 'ensure => absent for key/value':
      ensure  => absent,
<<<<<<< HEAD
      path    => "#{basedir}/ini_setting.ini",
=======
<<<<<<< HEAD
      path    => "#{tmpdir}/ini_setting.ini",
=======
      path    => "#{basedir}/ini_setting.ini",
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
      section => 'one',
      setting => 'two',
      value   => 'three',
    }
    EOS
<<<<<<< HEAD

    it 'applies the manifest twice' do
=======

    it 'applies the manifest twice' do
<<<<<<< HEAD
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe file("#{tmpdir}/ini_setting.ini") do
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
      idempotent_apply(pp)
    end

    describe file("#{basedir}/ini_setting.ini") do
<<<<<<< HEAD
      it { is_expected.to be_file }

      describe '#content' do
        subject { super().content }

        it { is_expected.to match %r{four = five} }
        it { is_expected.not_to match %r{\[one\]} }
        it { is_expected.not_to match %r{two = three} }
      end
    end
  end

  context 'ensure parameter => absent for global' do
    before :all do
      ipp = <<-MANIFEST
        file { '#{basedir}/ini_setting.ini':
          content => "four = five\n [one]\n two = three",
          force   => true,
        }
      MANIFEST

      apply_manifest(ipp)
    end

    after :all do
      run_shell("rm #{basedir}/ini_setting.ini", expect_failures: true)
    end

    pp = <<-EOS
    ini_setting { 'ensure => absent for global':
      ensure  => absent,
      path    => "#{basedir}/ini_setting.ini",
      section => '',
      setting => 'four',
      value   => 'five',
    }
    EOS

    it 'applies the manifest twice' do
=======
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
      it { is_expected.to be_file }

      describe '#content' do
        subject { super().content }

        it { is_expected.to match %r{four = five} }
        it { is_expected.not_to match %r{\[one\]} }
        it { is_expected.not_to match %r{two = three} }
=======
      shell("rm #{path}", :acceptable_exit_codes => [0, 1, 2])
    end
    after :all do
      shell("cat #{path}", :acceptable_exit_codes => [0, 1, 2])
      shell("rm #{path}", :acceptable_exit_codes => [0, 1, 2])
    end

    it 'applies the manifest and gets a failure message' do
      expect(apply_manifest(pp, :expect_failures => true).stderr).to match(error)
    end

    describe file(path) do
      it { should_not be_file }
    end
  end

  describe 'ensure parameter' do
    context '=> present for global and section' do
      pp = <<-EOS
      ini_setting { 'ensure => present for section':
        ensure  => present,
        path    => "#{tmpdir}/ini_setting.ini",
        section => 'one',
        setting => 'two',
        value   => 'three',
      }
      ini_setting { 'ensure => present for global':
        ensure  => present,
        path    => "#{tmpdir}/ini_setting.ini",
        section => '',
        setting => 'four',
        value   => 'five',
      }
      EOS

      it 'applies the manifest twice' do
        apply_manifest(pp, :catch_failures => true)
        apply_manifest(pp, :catch_changes => true)
      end

      it_behaves_like 'has_content', "#{tmpdir}/ini_setting.ini", pp, /four = five\n\n\[one\]\ntwo = three/
    end

    context '=> present for global and section (from previous blank value)' do
      before :all do
        if fact('osfamily') == 'Darwin'
          shell("echo \"four =[one]\ntwo =\" > #{tmpdir}/ini_setting.ini")
        else
          shell("echo -e \"four =\n[one]\ntwo =\" > #{tmpdir}/ini_setting.ini")
        end
      end

      pp = <<-EOS
      ini_setting { 'ensure => present for section':
        ensure  => present,
        path    => "#{tmpdir}/ini_setting.ini",
        section => 'one',
        setting => 'two',
        value   => 'three',
      }
      ini_setting { 'ensure => present for global':
        ensure  => present,
        path    => "#{tmpdir}/ini_setting.ini",
        section => '',
        setting => 'four',
        value   => 'five',
      }
      EOS

      it 'applies the manifest twice' do
        apply_manifest(pp, :catch_failures => true)
        apply_manifest(pp, :catch_changes => true)
      end

      it_behaves_like 'has_content', "#{tmpdir}/ini_setting.ini", pp, /four = five\n\n\[one\]\ntwo = three/
    end

    context '=> absent for key/value' do
      before :all do
        if fact('osfamily') == 'Darwin'
          shell("echo \"four = five[one]\ntwo = three\" > #{tmpdir}/ini_setting.ini")
        else
          shell("echo -e \"four = five\n[one]\ntwo = three\" > #{tmpdir}/ini_setting.ini")
        end
      end

      pp = <<-EOS
      ini_setting { 'ensure => absent for key/value':
        ensure  => absent,
        path    => "#{tmpdir}/ini_setting.ini",
        section => 'one',
        setting => 'two',
        value   => 'three',
      }
      EOS

      it 'applies the manifest twice' do
        apply_manifest(pp, :catch_failures => true)
        apply_manifest(pp, :catch_changes => true)
      end

      describe file("#{tmpdir}/ini_setting.ini") do
        it { should be_file }
        its(:content) {
          should match /four = five/
          should_not match /\[one\]/
          should_not match /two = three/
        }
      end
    end

    context '=> absent for global' do
      before :all do
        if fact('osfamily') == 'Darwin'
          shell("echo \"four = five\n[one]\ntwo = three\" > #{tmpdir}/ini_setting.ini")
        else
          shell("echo -e \"four = five\n[one]\ntwo = three\" > #{tmpdir}/ini_setting.ini")
        end
      end
      after :all do
        shell("cat #{tmpdir}/ini_setting.ini", :acceptable_exit_codes => [0, 1, 2])
        shell("rm #{tmpdir}/ini_setting.ini", :acceptable_exit_codes => [0, 1, 2])
      end

      pp = <<-EOS
      ini_setting { 'ensure => absent for global':
        ensure  => absent,
        path    => "#{tmpdir}/ini_setting.ini",
        section => '',
        setting => 'four',
        value   => 'five',
      }
      EOS

      it 'applies the manifest twice' do
        apply_manifest(pp, :catch_failures => true)
        apply_manifest(pp, :catch_changes => true)
      end

      describe file("#{tmpdir}/ini_setting.ini") do
        it { should be_file }
        its(:content) {
          should_not match /four = five/
          should match /\[one\]/
          should match /two = three/
        }
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      end
    end
  end

<<<<<<< HEAD
  context 'ensure parameter => absent for global' do
    before :all do
<<<<<<< HEAD
      ini = <<-EOS
        four = five
        [one]
        two = three
        EOS
      create_remote_file(default, File.join(tmpdir, 'ini_setting.ini'), ini)
    end
    after :all do
      shell("rm #{tmpdir}/ini_setting.ini", acceptable_exit_codes: [0, 1, 2])
=======
      ipp = <<-MANIFEST
        file { '#{basedir}/ini_setting.ini':
          content => "four = five\n [one]\n two = three",
          force   => true,
        }
      MANIFEST

      apply_manifest(ipp)
    end

    after :all do
      run_shell("rm #{basedir}/ini_setting.ini", expect_failures: true)
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
    end

    pp = <<-EOS
    ini_setting { 'ensure => absent for global':
      ensure  => absent,
<<<<<<< HEAD
      path    => "#{tmpdir}/ini_setting.ini",
=======
      path    => "#{basedir}/ini_setting.ini",
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
      section => '',
      setting => 'four',
      value   => 'five',
    }
    EOS

    it 'applies the manifest twice' do
<<<<<<< HEAD
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe file("#{tmpdir}/ini_setting.ini") do
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
      idempotent_apply(pp)
    end

    describe file("#{basedir}/ini_setting.ini") do
<<<<<<< HEAD
      it { is_expected.to be_file }

      describe '#content' do
        subject { super().content }

=======
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
      it { is_expected.to be_file }

      describe '#content' do
        subject { super().content }

>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
        it { is_expected.not_to match %r{four = five} }
        it { is_expected.to match %r{\[one\]} }
        it { is_expected.to match %r{two = three} }
      end
    end
  end

  describe 'path parameter' do
    context 'path => foo' do
=======
  describe 'section, setting, value parameters' do
    {
        "section => 'test', setting => 'foo', value => 'bar',"         => /\[test\]\nfoo = bar/,
        "section => 'more', setting => 'baz', value => 'quux',"        => /\[more\]\nbaz = quux/,
        "section => '',     setting => 'top', value => 'level',"       => /top = level/,
        "section => 'z',    setting => 'sp aces', value => 'foo bar'," => /\[z\]\nsp aces = foo bar/,
    }.each do |parameter_list, content|
      context parameter_list do
        pp = <<-EOS
        ini_setting { "#{parameter_list}":
          ensure  => present,
          path    => "#{tmpdir}/ini_setting.ini",
          #{parameter_list}
        }
        EOS

        it_behaves_like 'has_content', "#{tmpdir}/ini_setting.ini", pp, content
      end
    end

    {
        "section => 'test',"                   => /setting is a required.+value is a required/,
        "setting => 'foo',  value   => 'bar'," => /section is a required/,
        "section => 'test', setting => 'foo'," => /value is a required/,
        "section => 'test', value   => 'bar'," => /setting is a required/,
        "value   => 'bar',"                    => /section is a required.+setting is a required/,
        "setting => 'foo',"                    => /section is a required.+value is a required/,
    }.each do |parameter_list, error|
      context parameter_list, :pending => 'no error checking yet' do
        pp = <<-EOS
        ini_setting { "#{parameter_list}":
          ensure  => present,
          path    => "#{tmpdir}/ini_setting.ini",
          #{parameter_list}
        }
        EOS

        it_behaves_like 'has_error', "#{tmpdir}/ini_setting.ini", pp, error
      end
    end
  end

  describe 'path parameter' do
    [
        "#{tmpdir}/one.ini",
        "#{tmpdir}/two.ini",
        "#{tmpdir}/three.ini",
    ].each do |path|
      context "path => #{path}" do
        pp = <<-EOS
        ini_setting { 'path => #{path}':
          ensure  => present,
          section => 'one',
          setting => 'two',
          value   => 'three',
          path    => '#{path}',
        }
        EOS

        it_behaves_like 'has_content', path, pp, /\[one\]\ntwo = three/
      end
    end

    context "path => foo" do
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      pp = <<-EOS
        ini_setting { 'path => foo':
          ensure     => present,
          section    => 'one',
          setting    => 'two',
          value      => 'three',
          path       => 'foo',
        }
      EOS

<<<<<<< HEAD
      it_behaves_like 'has_error', 'foo', pp, %r{must be fully qualified}
=======
      it_behaves_like 'has_error', 'foo', pp, /must be fully qualified/
    end
  end

  describe 'key_val_separator parameter' do
    {
        ""                             => /two = three/,
        "key_val_separator => '=',"    => /two=three/,
        "key_val_separator => ' =  '," => /two =  three/,
        "key_val_separator => ' '," => /two three/,
        "key_val_separator => '   '," => /two   three/,
    }.each do |parameter, content|
      context "with \"#{parameter}\" makes \"#{content}\"" do
        pp = <<-EOS
        ini_setting { "with #{parameter} makes #{content}":
          ensure  => present,
          section => 'one',
          setting => 'two',
          value   => 'three',
          path    => "#{tmpdir}/key_val_separator.ini",
          #{parameter}
        }
        EOS

        it_behaves_like 'has_content', "#{tmpdir}/key_val_separator.ini", pp, content
      end
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    end
  end

  describe 'show_diff parameter and logging:' do
<<<<<<< HEAD
<<<<<<< HEAD
    setup_puppet_config_file

=======
<<<<<<< HEAD
=======
    setup_puppet_config_file

>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
    [{ value: 'initial_value', matcher: 'created', show_diff: true },
     { value: 'public_value', matcher: %r{initial_value.*public_value}, show_diff: true },
     { value: 'secret_value', matcher: %r{redacted sensitive information.*redacted sensitive information}, show_diff: false },
     { value: 'md5_value', matcher: %r{\{md5\}881671aa2bbc680bc530c4353125052b.*\{md5\}ed0903a7fa5de7886ca1a7a9ad06cf51}, show_diff: :md5 }].each do |i|
<<<<<<< HEAD
=======
<<<<<<< HEAD

=======
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
      pp = <<-EOS
=======
    [ {:value => "initial_value", :matcher => "created", :show_diff => true},
      {:value => "public_value", :matcher => /initial_value.*public_value/, :show_diff => true},
      {:value => "secret_value", :matcher => /redacted sensitive information.*redacted sensitive information/, :show_diff => false},
      {:value => "md5_value", :matcher => /{md5}881671aa2bbc680bc530c4353125052b.*{md5}ed0903a7fa5de7886ca1a7a9ad06cf51/, :show_diff => :md5}
    ].each do |i|
      context "show_diff => #{i[:show_diff]}" do
        pp = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
          ini_setting { 'test_show_diff':
            ensure      => present,
            section     => 'test',
            setting     => 'something',
            value       => '#{i[:value]}',
<<<<<<< HEAD
<<<<<<< HEAD
            path        => "#{basedir}/test_show_diff.ini",
=======
<<<<<<< HEAD
            path        => "#{tmpdir}/test_show_diff.ini",
=======
            path        => "#{basedir}/test_show_diff.ini",
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
            show_diff   => #{i[:show_diff]}
          }
      EOS

      context "show_diff => #{i[:show_diff]}" do
<<<<<<< HEAD
=======
<<<<<<< HEAD
        config = { 'main' => { 'show_diff' => true } }
        configure_puppet_on(default, config)

=======
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
        res = apply_manifest(pp, expect_changes: true)
        it 'applies manifest and expects changed value to be logged in proper form' do
          expect(res.stdout).to match(i[:matcher])
        end
        it 'applies manifest and expects changed value to be logged in proper form #optional test' do
          expect(res.stdout).not_to match(i[:value]) unless i[:show_diff] == true
        end
      end
    end
  end
<<<<<<< HEAD

  describe 'values with spaces in the value part at the beginning or at the end' do
    pp = <<-EOS
      ini_setting { 'path => foo':
          ensure     => present,
          section    => 'one',
          setting    => 'two',
          value      => '               123',
          path       => '#{basedir}/ini_setting.ini',
        }
    EOS

=======

  describe 'values with spaces in the value part at the beginning or at the end' do
    pp = <<-EOS
      ini_setting { 'path => foo':
          ensure     => present,
          section    => 'one',
          setting    => 'two',
          value      => '               123',
<<<<<<< HEAD
          path       => '#{tmpdir}/ini_setting.ini',
        }
    EOS

    it_behaves_like 'has_content', "#{tmpdir}/ini_setting.ini", pp, %r{\[one\]\ntwo = 123}
  end

  describe 'refreshonly' do
    path = File.join(tmpdir, 'test.txt')
    before :each do
      shell("echo \"[section1]\nvalueinsection1 = 123\" > #{path}")
    end
    after :each do
      shell("rm #{path}", acceptable_exit_codes: [0, 1, 2])
=======
          path       => '#{basedir}/ini_setting.ini',
        }
    EOS

>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
    it_behaves_like 'has_content', "#{basedir}/ini_setting.ini", pp, %r{\[one\]\Rtwo = 123}
  end

  describe 'refreshonly' do
    before :each do
      ipp = <<-MANIFEST
        file { '#{basedir}/ini_setting.ini':
          content => "[section1]\n valueinsection1 = 123\",
          force   => true,
        }
      MANIFEST

      apply_manifest(ipp)
    end

    after :each do
      run_shell("rm #{basedir}/ini_setting.ini", expect_failures: true)
<<<<<<< HEAD
=======
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
    end
    context 'when event is triggered' do
      context 'update setting value' do
        let(:update_value_manifest) do
          <<-EOS
          notify { foo:
            notify => Ini_Setting['updateSetting'],
          }

          ini_setting { "updateSetting":
            ensure => present,
<<<<<<< HEAD
            path => "#{basedir}/ini_setting.ini",
=======
<<<<<<< HEAD
            path => "#{path}",
=======
            path => "#{basedir}/ini_setting.ini",
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
            section => 'section1',
            setting => 'valueinsection1',
            value   => "newValue",
            refreshonly => true,
          }
          EOS
        end
<<<<<<< HEAD

        before(:each) do
          apply_manifest(update_value_manifest, expect_changes: true)
        end

        describe file("#{basedir}/ini_setting.ini") do
          it { is_expected.to be_file }
          describe '#content' do
            subject { super().content }

            it { is_expected.to match %r{valueinsection1 = newValue} }
          end
        end
      end

=======

        before(:each) do
          apply_manifest(update_value_manifest, expect_changes: true)
        end

<<<<<<< HEAD
        describe file(path) do
=======
        describe file("#{basedir}/ini_setting.ini") do
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
          it { is_expected.to be_file }
          describe '#content' do
            subject { super().content }

            it { is_expected.to match %r{valueinsection1 = newValue} }
          end
        end
      end

>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
      context 'remove setting value' do
        let(:remove_setting_manifest) do
          <<-EOS
          notify { foo:
            notify => Ini_Setting['removeSetting'],
          }

          ini_setting { "removeSetting":
            ensure => absent,
<<<<<<< HEAD
            path => "#{basedir}/ini_setting.ini",
=======
<<<<<<< HEAD
            path => "#{path}",
=======
            path => "#{basedir}/ini_setting.ini",
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
            section => 'section1',
            setting => 'valueinsection1',
            refreshonly => true,
          }
          EOS
        end

        before(:each) do
          apply_manifest(remove_setting_manifest, expect_changes: true)
        end

<<<<<<< HEAD
        describe file("#{basedir}/ini_setting.ini") do
=======
<<<<<<< HEAD
        describe file(path) do
=======
        describe file("#{basedir}/ini_setting.ini") do
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
          it { is_expected.to be_file }
          describe '#content' do
            subject { super().content }

            it { is_expected.to be_empty }
          end
        end
      end
    end

    context 'when not receiving an event' do
      context 'does not update setting' do
        let(:does_not_update_value_manifest) do
          <<-EOS
<<<<<<< HEAD
=======
<<<<<<< HEAD
          file { "#{path}":
            ensure => present,
            notify => Ini_Setting['updateSetting'],
          }

          ini_setting { "updateSetting":
            ensure => present,
            path => "#{path}",
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
          file { "#{basedir}/ini_setting.ini":
            ensure => present,
            notify => Ini_Setting['updateSetting'],
          }
          ini_setting { "updateSetting":
            ensure => present,
            path => "#{basedir}/ini_setting.ini",
<<<<<<< HEAD
=======
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
            section => 'section1',
            setting => 'valueinsection1',
            value   => "newValue",
            refreshonly => true,
          }
          EOS
        end

        before(:each) do
          apply_manifest(does_not_update_value_manifest, expect_changes: false)
        end

<<<<<<< HEAD
        describe file("#{basedir}/ini_setting.ini") do
=======
<<<<<<< HEAD
        describe file(path) do
=======
        describe file("#{basedir}/ini_setting.ini") do
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
          it { is_expected.to be_file }
          describe '#content' do
            subject { super().content }

            it { is_expected.to match %r{valueinsection1 = 123} }
            it { is_expected.to match %r{\[section1\]} }
          end
        end
      end

      context 'does not remove setting' do
        let(:does_not_remove_setting_manifest) do
          <<-EOS
<<<<<<< HEAD
          file { "#{basedir}/ini_setting.ini":
=======
<<<<<<< HEAD
          file { "#{path}":
=======
          file { "#{basedir}/ini_setting.ini":
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
            ensure => present,
            notify => Ini_Setting['removeSetting'],
          }

          ini_setting { "removeSetting":
            ensure => absent,
<<<<<<< HEAD
            path => "#{basedir}/ini_setting.ini",
=======
<<<<<<< HEAD
            path => "#{path}",
=======
            path => "#{basedir}/ini_setting.ini",
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
            section => 'section1',
            setting => 'valueinsection1',
            refreshonly => true,
          }
          EOS
        end

        before(:each) do
          apply_manifest(does_not_remove_setting_manifest, expect_changes: false)
        end

<<<<<<< HEAD
        describe file("#{basedir}/ini_setting.ini") do
=======
<<<<<<< HEAD
        describe file(path) do
=======
        describe file("#{basedir}/ini_setting.ini") do
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
          it { is_expected.to be_file }
          describe '#content' do
            subject { super().content }

            it { is_expected.not_to be_empty }
            it { is_expected.to match %r{valueinsection1 = 123} }
            it { is_expected.to match %r{\[section1\]} }
          end
=======
            path        => "#{tmpdir}/test_show_diff.ini",
            show_diff   => #{i[:show_diff]} 
          }
        EOS

        it "applies manifest and expects changed value to be logged in proper form" do
          config = {
            'main' => {
              'show_diff'   => true
            }
          }
          configure_puppet_on(default, config)

          res = apply_manifest(pp, :expect_changes => true)
          expect(res.stdout).to match(i[:matcher])
          expect(res.stdout).not_to match(i[:value]) unless (i[:show_diff] == true)

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
        end
      end
    end
  end
<<<<<<< HEAD
=======

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
end
