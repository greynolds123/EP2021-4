require 'digest/md5'

Puppet::Type.newtype(:ini_subsetting) do
<<<<<<< HEAD
  desc 'ini_subsettings is used to manage multiple values in a setting in an INI file'
  ensurable do
    desc 'Ensurable method handles modeling creation. It creates an ensure property'
=======

  ensurable do
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    defaultvalues
    defaultto :present
  end

  def munge_boolean_md5(value)
    case value
    when true, :true, 'true', :yes, 'yes'
      :true
    when false, :false, 'false', :no, 'no'
      :false
    when :md5, 'md5'
      :md5
    else
<<<<<<< HEAD
      raise(_('expected a boolean value or :md5'))
    end
  end
  newparam(:name, namevar: true) do
=======
      fail('expected a boolean value or :md5')
    end
  end

  newparam(:name, :namevar => true) do
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    desc 'An arbitrary name used as the identity of the resource.'
  end

  newparam(:section) do
<<<<<<< HEAD
    desc 'The name of the section in the ini file in which the setting should be defined.'
    defaultto('')
=======
    desc 'The name of the section in the ini file in which the setting should be defined.' +
      'If not provided, defaults to global, top of file, sections.'
    defaultto("")
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
  end

  newparam(:setting) do
    desc 'The name of the setting to be defined.'
  end

  newparam(:subsetting) do
    desc 'The name of the subsetting to be defined.'
  end

  newparam(:subsetting_separator) do
<<<<<<< HEAD
    desc 'The separator string between subsettings. Defaults to the empty string.'
    defaultto(' ')
=======
    desc 'The separator string between subsettings. Defaults to " "'
    defaultto(" ")
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
  end

  newparam(:subsetting_key_val_separator) do
    desc 'The separator string between the subsetting name and its value. Defaults to the empty string.'
    defaultto('')
  end

  newparam(:path) do
    desc 'The ini file Puppet will ensure contains the specified setting.'
    validate do |value|
<<<<<<< HEAD
      unless Puppet::Util.absolute_path?(value)
        raise(Puppet::Error, _("File paths must be fully qualified, not '%{value}'") % { value: value })
      end
    end
  end
=======
      unless (Puppet.features.posix? and value =~ /^\//) or (Puppet.features.microsoft_windows? and (value =~ /^.:\// or value =~ /^\/\/[^\/]+\/[^\/]+/))
        raise(Puppet::Error, "File paths must be fully qualified, not '#{value}'")
      end
    end
  end

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
  newparam(:show_diff) do
    desc 'Whether to display differences when the setting changes.'
    defaultto :true
    newvalues(:true, :md5, :false)

    munge do |value|
      @resource.munge_boolean_md5(value)
    end
  end

  newparam(:key_val_separator) do
<<<<<<< HEAD
    desc 'The separator string to use between each setting name and value.'
    defaultto(' = ')
  end

  newparam(:quote_char) do
<<<<<<< HEAD
    desc "The character used to quote the entire value of the setting. Valid values are '', '\"' and \"'\""
=======
<<<<<<< HEAD
    desc 'The character used to quote the entire value of the setting. ' +
         %q(Valid values are '', '"' and "'")
=======
    desc "The character used to quote the entire value of the setting. Valid values are '', '\"' and \"'\""
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
    defaultto('')

    validate do |value|
      unless value =~ %r{^["']?$}
        raise Puppet::Error, _(%q(:quote_char valid values are '', '"' and "'"))
=======
    desc 'The separator string to use between each setting name and value. ' +
        'Defaults to " = ", but you could use this to override e.g. ": ", or' +
        'whether or not the separator should include whitespace.'
    defaultto(" = ")
  end

  newparam(:quote_char) do
    desc 'The character used to quote the entire value of the setting. ' +
        %q{Valid values are '', '"' and "'". Defaults to ''.}
    defaultto('')

    validate do |value|
      unless value =~ /^["']?$/
        raise Puppet::Error, %q{:quote_char valid values are '', '"' and "'"}
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      end
    end
  end

  newparam(:use_exact_match) do
<<<<<<< HEAD
    desc 'Set to true if your subsettings don\'t have values and you want to use exact matches to determine if the subsetting exists.'
=======
    desc 'Set to true if your subsettings don\'t have values and you want to use exact matches to determine if the subsetting exists. See MODULES-2212'
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    newvalues(:true, :false)
    defaultto(:false)
  end

  newproperty(:value) do
    desc 'The value of the subsetting to be defined.'

    def should_to_s(newvalue)
<<<<<<< HEAD
      if @resource[:show_diff] == :true && Puppet[:show_diff]
        newvalue
      elsif @resource[:show_diff] == :md5 && Puppet[:show_diff]
        '{md5}' + Digest::MD5.hexdigest(newvalue.to_s)
      else
        '[redacted sensitive information]'
      end
    end

    def is_to_s(value) # rubocop:disable Style/PredicateName : Changing breaks the code (./.bundle/gems/gems/puppet-5.3.3-universal-darwin/lib/puppet/parameter.rb:525:in `to_s')
=======
      if (@resource[:show_diff] == :true && Puppet[:show_diff]) then
        return newvalue
      elsif (@resource[:show_diff] == :md5 && Puppet[:show_diff]) then
        return '{md5}' + Digest::MD5.hexdigest(newvalue.to_s)
      else
        return '[redacted sensitive information]'
      end
    end

    def is_to_s(value)
      should_to_s(value)
    end

    def is_to_s(value)
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      should_to_s(value)
    end
  end

  newparam(:insert_type) do
    desc <<-eof
<<<<<<< HEAD
      Where the new subsetting item should be inserted

      * :start  - insert at the beginning of the line.
      * :end    - insert at the end of the line (default).
      * :before - insert before the specified element if possible.
      * :after  - insert after the specified element if possible.
      * :index  - insert at the specified index number.
=======
Where the new subsetting item should be inserted?

* :start  - insert at the beginning of the line.
* :end    - insert at the end of the line (default).
* :before - insert before the specified element if possible.
* :after  - insert after the specified element if possible.
* :index  - insert at the specified index number.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    eof

    newvalues(:start, :end, :before, :after, :index)
    defaultto(:end)
  end

  newparam(:insert_value) do
    desc 'The value for the insert types which require one.'
  end
<<<<<<< HEAD
=======

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
end
