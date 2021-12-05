require 'spec_helper_acceptance'

<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
tmpdir = default.tmpdir('tmp')

>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
describe 'ini_subsetting resource' do
  basedir = setup_test_directory

  after :all do
<<<<<<< HEAD
    run_shell("rm #{basedir}/*.ini", expect_failures: true)
=======
    shell("rm #{tmpdir}/*.ini", acceptable_exit_codes: [0, 1, 2])
=======
describe 'ini_subsetting resource' do
  basedir = setup_test_directory

  after :all do
    run_shell("rm #{basedir}/*.ini", expect_failures: true)
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
tmpdir = default.tmpdir('tmp')

describe 'ini_subsetting resource' do
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

        it {
          is_expected.to match content
        }
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
      its(:content) {
        should match content
      }
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

  describe 'ensure, section, setting, subsetting, & value parameters => present with subsections' do
    pp = <<-EOS
    ini_subsetting { 'ensure => present for alpha':
      ensure     => present,
<<<<<<< HEAD
      path       => "#{basedir}/ini_subsetting.ini",
=======
<<<<<<< HEAD
      path       => "#{tmpdir}/ini_subsetting.ini",
=======
      path       => "#{basedir}/ini_subsetting.ini",
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
      section    => 'one',
      setting    => 'key',
      subsetting => 'alpha',
      value      => 'bet',
    }
    ini_subsetting { 'ensure => present for beta':
      ensure     => present,
<<<<<<< HEAD
      path       => "#{basedir}/ini_subsetting.ini",
=======
<<<<<<< HEAD
      path       => "#{tmpdir}/ini_subsetting.ini",
=======
      path       => "#{basedir}/ini_subsetting.ini",
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
      section    => 'one',
      setting    => 'key',
      subsetting => 'beta',
      value      => 'trons',
      require    => Ini_subsetting['ensure => present for alpha'],
    }
    EOS

<<<<<<< HEAD
    describe file("#{basedir}/ini_subsetting.ini") do
      it_behaves_like 'has_content', "#{basedir}/ini_subsetting.ini", pp, %r{\[one\]\Rkey = alphabet betatrons}
    end
  end

  describe 'ensure => absent' do
    pp = <<-EOS
    ini_subsetting { 'ensure => absent for subsetting':
      ensure     => absent,
      path       => "#{basedir}/ini_subsetting.ini",
      section    => 'one',
      setting    => 'key',
      subsetting => 'alpha',
    }
    EOS

    it 'applies the manifest twice' do
=======
<<<<<<< HEAD
    describe file("#{tmpdir}/ini_subsetting.ini") do
      it_behaves_like 'has_content', "#{tmpdir}/ini_subsetting.ini", pp, %r{\[one\]\nkey = alphabet betatrons}
=======
    describe file("#{basedir}/ini_subsetting.ini") do
      it_behaves_like 'has_content', "#{basedir}/ini_subsetting.ini", pp, %r{\[one\]\Rkey = alphabet betatrons}
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
    end
  end

  describe 'ensure => absent' do
    pp = <<-EOS
    ini_subsetting { 'ensure => absent for subsetting':
      ensure     => absent,
<<<<<<< HEAD
      path       => "#{tmpdir}/ini_subsetting.ini",
=======
      path       => "#{basedir}/ini_subsetting.ini",
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
      section    => 'one',
      setting    => 'key',
      subsetting => 'alpha',
    }
    EOS

    it 'applies the manifest twice' do
<<<<<<< HEAD
      idempotent_apply(default, pp, {})
    end

    describe file("#{tmpdir}/ini_subsetting.ini") do
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
      idempotent_apply(pp)
    end

    describe file("#{basedir}/ini_subsetting.ini") do
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
        it { is_expected.to match %r{\[one\]} }
        it { is_expected.to match %r{key = betatrons} }
        it { is_expected.not_to match %r{alphabet} }
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

  describe 'ensure, section, setting, subsetting, & value parameters' do
    context '=> present with subsections' do
      pp = <<-EOS
      ini_subsetting { 'ensure => present for alpha':
        ensure     => present,
        path       => "#{tmpdir}/ini_subsetting.ini",
        section    => 'one',
        setting    => 'key',
        subsetting => 'alpha',
        value      => 'bet',
      }
      ini_subsetting { 'ensure => present for beta':
        ensure     => present,
        path       => "#{tmpdir}/ini_subsetting.ini",
        section    => 'one',
        setting    => 'key',
        subsetting => 'beta',
        value      => 'trons',
        require    => Ini_subsetting['ensure => present for alpha'],
      }
      EOS

      it 'applies the manifest twice' do
        apply_manifest(pp, :catch_failures => true)
        apply_manifest(pp, :catch_changes => true)
      end

      describe file("#{tmpdir}/ini_subsetting.ini") do
        it { should be_file }
        its(:content) {
          should match /\[one\]\nkey = alphabet betatrons/
        }
      end
    end

    context 'ensure => absent' do
      before :all do
        if fact('osfamily') == 'Darwin'
          shell("echo \"[one]\nkey = alphabet betatrons\" > #{tmpdir}/ini_subsetting.ini")
        else
          shell("echo -e \"[one]\nkey = alphabet betatrons\" > #{tmpdir}/ini_subsetting.ini")
        end
      end

      pp = <<-EOS
      ini_subsetting { 'ensure => absent for subsetting':
        ensure     => absent,
        path       => "#{tmpdir}/ini_subsetting.ini",
        section    => 'one',
        setting    => 'key',
        subsetting => 'alpha',
      }
      EOS

      it 'applies the manifest twice' do
        apply_manifest(pp, :catch_failures => true)
        apply_manifest(pp, :catch_changes => true)
      end

      describe file("#{tmpdir}/ini_subsetting.ini") do
        it { should be_file }
        its(:content) {
          should match /\[one\]/
          should match /key = betatrons/
          should_not match /alphabet/
        }
      end
    end
  end

  describe 'subsetting_separator' do
    {
        ""                                => /two = twinethree foobar/,
        "subsetting_separator => ',',"    => /two = twinethree,foobar/,
        "subsetting_separator => '   ',"  => /two = twinethree   foobar/,
        "subsetting_separator => ' == '," => /two = twinethree == foobar/,
        "subsetting_separator => '=',"    => /two = twinethree=foobar/,
    }.each do |parameter, content|
      context "with \"#{parameter}\" makes \"#{content}\"" do
        pp = <<-EOS
        ini_subsetting { "with #{parameter} makes #{content}":
          ensure     => present,
          section    => 'one',
          setting    => 'two',
          subsetting => 'twine',
          value      => 'three',
          path       => "#{tmpdir}/subsetting_separator.ini",
          before     => Ini_subsetting['foobar'],
          #{parameter}
        }
        ini_subsetting { "foobar":
          ensure     => present,
          section    => 'one',
          setting    => 'two',
          subsetting => 'foo',
          value      => 'bar',
          path       => "#{tmpdir}/subsetting_separator.ini",
          #{parameter}
        }
        EOS

        it_behaves_like 'has_content', "#{tmpdir}/subsetting_separator.ini", pp, content
      end
    end
  end

  describe 'subsetting_key_val_separator' do
    {
        ''                                        => /two = twinethree foobar/,
        "subsetting_key_val_separator => ':',"    => /two = twine:three foo:bar/,
        "subsetting_key_val_separator => '-',"    => /two = twine-three foo-bar/,
    }.each do |parameter, content|
      context "with '#{parameter}' makes '#{content}'" do
        pp = <<-EOS
        ini_subsetting { "with #{parameter} makes #{content}":
          ensure     => 'present',
          section    => 'one',
          setting    => 'two',
          subsetting => 'twine',
          value      => 'three',
          path       => "#{tmpdir}/subsetting_key_val_separator.ini",
          before     => Ini_subsetting['foobar'],
          #{parameter}
        }
        ini_subsetting { "foobar":
          ensure     => 'present',
          section    => 'one',
          setting    => 'two',
          subsetting => 'foo',
          value      => 'bar',
          path       => "#{tmpdir}/subsetting_key_val_separator.ini",
          #{parameter}
        }
        EOS

        it_behaves_like 'has_content', "#{tmpdir}/subsetting_key_val_separator.ini", pp, content
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      end
    end
  end

  describe 'quote_char' do
    {
<<<<<<< HEAD
      ['-Xmx'] => %r{args=""},
      ['-Xmx', '256m'] => %r{args=-Xmx256m},
      ['-Xmx', '512m'] => %r{args="-Xmx512m"},
      ['-Xms', '256m'] => %r{args="-Xmx256m -Xms256m"},
    }.each do |parameter, content|
      context %(with '#{parameter.first}' #{(parameter.length > 1) ? '=> \'' << parameter[1] << '\'' : 'absent'} makes '#{content}') do
<<<<<<< HEAD
        path = File.join(basedir, 'ini_subsetting.ini')
        before :all do
          ipp = <<-MANIFEST
        file { '#{path}':
          content => "[java]\nargs=-Xmx256m",
          force   => true,
        }
        MANIFEST

          apply_manifest(ipp)
=======
<<<<<<< HEAD
        path = File.join(tmpdir, 'ini_subsetting.ini')

        before :all do
          shell(%(echo '[java]\nargs=-Xmx256m' > #{path}))
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
        end

        after :all do
<<<<<<< HEAD
          run_shell("cat #{path}", expect_failures: true)
          run_shell("rm #{path}", expect_failures: true)
=======
          shell("cat #{path}", acceptable_exit_codes: [0, 1, 2])
          shell("rm #{path}", acceptable_exit_codes: [0, 1, 2])
=======
        path = File.join(basedir, 'ini_subsetting.ini')
        before :all do
          ipp = <<-MANIFEST
        file { '#{path}':
          content => "[java]\nargs=-Xmx256m",
          force   => true,
        }
        MANIFEST

          apply_manifest(ipp)
        end

        after :all do
          run_shell("cat #{path}", expect_failures: true)
          run_shell("rm #{path}", expect_failures: true)
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
        ['-Xmx']         => /args=""/,
        ['-Xmx', '256m'] => /args=-Xmx256m/,
        ['-Xmx', '512m'] => /args="-Xmx512m"/,
        ['-Xms', '256m'] => /args="-Xmx256m -Xms256m"/,
    }.each do |parameter, content|
      context %Q{with '#{parameter.first}' #{parameter.length > 1 ? '=> \'' << parameter[1] << '\'' : 'absent'} makes '#{content}'} do
        path = File.join(tmpdir, 'ini_subsetting.ini')

        before :all do
          shell(%Q{echo '[java]\nargs=-Xmx256m' > #{path}})
        end
        after :all do
          shell("cat #{path}", :acceptable_exit_codes => [0, 1, 2])
          shell("rm #{path}", :acceptable_exit_codes => [0, 1, 2])
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
        end

        pp = <<-EOS
        ini_subsetting { '#{parameter.first}':
<<<<<<< HEAD
          ensure     => #{(parameter.length > 1) ? 'present' : 'absent'},
=======
          ensure     => #{parameter.length > 1 ? 'present' : 'absent'},
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
          path       => '#{path}',
          section    => 'java',
          setting    => 'args',
          quote_char => '"',
          subsetting => '#{parameter.first}',
<<<<<<< HEAD
          value      => '#{(parameter.length > 1) ? parameter[1] : ''}'
=======
          value      => '#{parameter.length > 1 ? parameter[1] : ''}'
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
        }
        EOS

        it 'applies the manifest twice' do
<<<<<<< HEAD
<<<<<<< HEAD
          idempotent_apply(pp)
        end

        describe file("#{basedir}/ini_subsetting.ini") do
=======
<<<<<<< HEAD
          idempotent_apply(default, pp, {})
        end

        describe file("#{tmpdir}/ini_subsetting.ini") do
=======
          idempotent_apply(pp)
        end

        describe file("#{basedir}/ini_subsetting.ini") do
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
          it { is_expected.to be_file }

          describe '#content' do
            subject { super().content }

            it { is_expected.to match content }
          end
=======
          apply_manifest(pp, :catch_failures => true)
          apply_manifest(pp, :catch_changes => true)
        end

        describe file("#{tmpdir}/ini_subsetting.ini") do
          it { should be_file }
          its(:content) {
            should match content
          }
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
        end
      end
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

      pp = <<-EOS
=======
<<<<<<< HEAD
      context "show_diff => #{i[:show_diff]}" do
        pp = <<-EOS
=======

      pp = <<-EOS
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
    [ {:value => "initial_value", :matcher => "created", :show_diff => true},
      {:value => "public_value", :matcher => /initial_value.*public_value/, :show_diff => true},
      {:value => "secret_value", :matcher => /redacted sensitive information.*redacted sensitive information/, :show_diff => false},
      {:value => "md5_value", :matcher => /{md5}881671aa2bbc680bc530c4353125052b.*{md5}ed0903a7fa5de7886ca1a7a9ad06cf51/, :show_diff => :md5}
    ].each do |i|
      context "show_diff => #{i[:show_diff]}" do
        pp = <<-EOS
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
          ini_subsetting { 'test_show_diff':
            ensure      => present,
            section     => 'test',
            setting     => 'something',
            subsetting  => 'xxx',
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

<<<<<<< HEAD
      context "show_diff => #{i[:show_diff]}" do
=======
<<<<<<< HEAD
        config = { 'main' => { 'show_diff' => true } }
        configure_puppet_on(default, config)

=======
      context "show_diff => #{i[:show_diff]}" do
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
        res = apply_manifest(pp, expect_changes: true)
        it 'applies manifest and expects changed value to be logged in proper form' do
          expect(res.stdout).to match(i[:matcher])
        end
        it 'applies manifest and expects changed value to be logged in proper form #optional test' do
          expect(res.stdout).not_to match(i[:value]) unless i[:show_diff] == true
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

  describe 'insert types:' do
    [
<<<<<<< HEAD
      {
        insert_type: :start,
        content: %r{d a b c},
      },
      {
        insert_type: :end,
        content: %r{a b c d},
      },
      {
        insert_type: :before,
        insert_value: 'c',
        content: %r{a b d c},
      },
      {
        insert_type: :after,
        insert_value: 'a',
        content: %r{a d b c},
      },
      {
        insert_type: :index,
        insert_value: 2,
        content: %r{a b d c},
      },
=======
        {
            :insert_type => :start,
            :content     => /d a b c/,
        },
        {
            :insert_type => :end,
            :content     => /a b c d/,
        },
        {
            :insert_type  => :before,
            :insert_value => 'c',
            :content      => /a b d c/,
        },
        {
            :insert_type  => :after,
            :insert_value => 'a',
            :content      => /a d b c/,
        },
        {
            :insert_type  => :index,
            :insert_value => 2,
            :content      => /a b d c/,
        }
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    ].each do |params|
      context "with '#{params[:insert_type]}' makes '#{params[:content]}'" do
        pp = <<-EOS
        ini_subsetting { "a":
          ensure     => present,
          section    => 'one',
          setting    => 'two',
          subsetting => 'a',
<<<<<<< HEAD
<<<<<<< HEAD
          path       => "#{basedir}/insert_types.ini",
=======
<<<<<<< HEAD
          path       => "#{tmpdir}/insert_types.ini",
=======
          path       => "#{basedir}/insert_types.ini",
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
          path       => "#{tmpdir}/insert_types.ini",
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
        } ->
        ini_subsetting { "b":
          ensure     => present,
          section    => 'one',
          setting    => 'two',
          subsetting => 'b',
<<<<<<< HEAD
<<<<<<< HEAD
          path       => "#{basedir}/insert_types.ini",
=======
<<<<<<< HEAD
          path       => "#{tmpdir}/insert_types.ini",
=======
          path       => "#{basedir}/insert_types.ini",
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
          path       => "#{tmpdir}/insert_types.ini",
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
        } ->
        ini_subsetting { "c":
          ensure     => present,
          section    => 'one',
          setting    => 'two',
          subsetting => 'c',
<<<<<<< HEAD
<<<<<<< HEAD
          path       => "#{basedir}/insert_types.ini",
=======
<<<<<<< HEAD
          path       => "#{tmpdir}/insert_types.ini",
=======
          path       => "#{basedir}/insert_types.ini",
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
          path       => "#{tmpdir}/insert_types.ini",
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
        } ->
        ini_subsetting { "insert makes #{params[:content]}":
          ensure       => present,
          section      => 'one',
          setting      => 'two',
          subsetting   => 'd',
<<<<<<< HEAD
<<<<<<< HEAD
          path         => "#{basedir}/insert_types.ini",
=======
<<<<<<< HEAD
          path         => "#{tmpdir}/insert_types.ini",
=======
          path         => "#{basedir}/insert_types.ini",
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
          path         => "#{tmpdir}/insert_types.ini",
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
          insert_type  => '#{params[:insert_type]}',
          insert_value => '#{params[:insert_value]}',
        }
        EOS

<<<<<<< HEAD
<<<<<<< HEAD
        it_behaves_like 'has_content', "#{basedir}/insert_types.ini", pp, params[:content]
=======
<<<<<<< HEAD
        it_behaves_like 'has_content', "#{tmpdir}/insert_types.ini", pp, params[:content]
=======
        it_behaves_like 'has_content', "#{basedir}/insert_types.ini", pp, params[:content]
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
      end
    end
  end
=======
        it_behaves_like 'has_content', "#{tmpdir}/insert_types.ini", pp, params[:content]
      end
    end
  end

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
end
