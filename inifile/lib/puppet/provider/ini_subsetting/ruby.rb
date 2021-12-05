require File.expand_path('../../../util/ini_file', __FILE__)
require File.expand_path('../../../util/setting_value', __FILE__)

Puppet::Type.type(:ini_subsetting).provide(:ruby) do
<<<<<<< HEAD
  desc '
  Creates new ini_subsetting file, a specific config file with a provider that uses
  this as its parent and implements the method
  self.file_path, and that will provide the value for the path to the
  ini file.'
=======

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
  def exists?
    setting_value.get_subsetting_value(subsetting, resource[:use_exact_match])
  end

  def create
    setting_value.add_subsetting(
<<<<<<< HEAD
      subsetting, resource[:value], resource[:use_exact_match],
      resource[:insert_type], resource[:insert_value]
    )
    ini_file.set_value(section, setting, key_val_separator, setting_value.get_value)
=======
        subsetting, resource[:value], resource[:use_exact_match],
        resource[:insert_type], resource[:insert_value]
    )
    ini_file.set_value(section, setting, setting_value.get_value)
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    ini_file.save
    @ini_file = nil
    @setting_value = nil
  end

  def destroy
    setting_value.remove_subsetting(subsetting, resource[:use_exact_match])
<<<<<<< HEAD
    ini_file.set_value(section, setting, key_val_separator, setting_value.get_value)
=======
    ini_file.set_value(section, setting, setting_value.get_value)
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    ini_file.save
    @ini_file = nil
    @setting_value = nil
  end

  def value
    setting_value.get_subsetting_value(subsetting)
  end

  def value=(value)
    setting_value.add_subsetting(
<<<<<<< HEAD
      subsetting, value, resource[:use_exact_match],
      resource[:insert_type], resource[:insert_value]
    )
    ini_file.set_value(section, setting, key_val_separator, setting_value.get_value)
=======
        subsetting, value, resource[:use_exact_match],
        resource[:insert_type], resource[:insert_value]
    )
    ini_file.set_value(section, setting, setting_value.get_value)
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    ini_file.save
  end

  def section
    resource[:section]
  end

  def setting
    resource[:setting]
  end

  def subsetting
    resource[:subsetting]
  end

  def subsetting_separator
    resource[:subsetting_separator]
  end

  def file_path
    resource[:path]
  end

  def key_val_separator
    resource[:key_val_separator] || '='
  end

  def subsetting_key_val_separator
    resource[:subsetting_key_val_separator] || ''
  end

  def quote_char
    resource[:quote_char]
  end

  private
<<<<<<< HEAD

=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
  def ini_file
    @ini_file ||= Puppet::Util::IniFile.new(file_path, key_val_separator)
  end

  def setting_value
    @setting_value ||= Puppet::Util::SettingValue.new(
<<<<<<< HEAD
      ini_file.get_value(section, setting),
      subsetting_separator, quote_char, subsetting_key_val_separator
    )
  end
=======
        ini_file.get_value(section, setting),
        subsetting_separator, quote_char, subsetting_key_val_separator
    )
  end

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
end
