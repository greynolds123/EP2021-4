class Puppet::Util::IniFile
<<<<<<< HEAD
  #
  # section.rb
  #
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
  class Section
    # Some implementation details:
    #
    #  * `name` will be set to the empty string for the 'global' section.
    #  * there will always be a 'global' section, with a `start_line` of 0,
    #    but if the file actually begins with a real section header on
    #    the first line, then the 'global' section will have an
    #    `end_line` of `nil`.
    #  * `start_line` and `end_line` will be set to `nil` for a new non-global
    #    section.
    def initialize(name, start_line, end_line, settings, indentation)
      @name = name
      @start_line = start_line
      @end_line = end_line
      @existing_settings = settings.nil? ? {} : settings
      @additional_settings = {}
      @indentation = indentation
    end

    attr_reader :name, :start_line, :end_line, :additional_settings, :indentation

<<<<<<< HEAD
    def global?
      @name == ''
    end

    def new_section?
=======
    def is_global?()
      @name == ''
    end

    def is_new_section?()
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      # a new section (global or named) will always have `end_line`
      # set to `nil`
      @end_line.nil?
    end

    def setting_names
      @existing_settings.keys | @additional_settings.keys
    end

    def get_value(setting_name)
      @existing_settings[setting_name] || @additional_settings[setting_name]
    end

<<<<<<< HEAD
    def existing_setting?(setting_name)
      @existing_settings.key?(setting_name)
    end

    # the global section is empty whenever it's new;
    # other sections are empty when they have no lines
    def empty?
      global? ? new_section? : start_line == end_line
=======
    def has_existing_setting?(setting_name)
      @existing_settings.has_key?(setting_name)
    end

    def empty?
      start_line == end_line
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    end

    def update_existing_setting(setting_name, value)
      @existing_settings[setting_name] = value
    end

    def remove_existing_setting(setting_name)
<<<<<<< HEAD
      @end_line -= 1 if @existing_settings.delete(setting_name) && @end_line
=======
      if (@existing_settings.delete(setting_name))
        if @end_line
          @end_line = @end_line - 1
        end
      end
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    end

    # This is a hacky method; it's basically called when we need to insert
    # a new setting but we don't want it to appear at the very end of the
    # section.  Instead we hack it into the existing settings list and
    # increment our end_line number--this assumes that the caller (`ini_file`)
    # is doing some babysitting w/rt the other sections and the actual data
    # of the lines.
    def insert_inline_setting(setting_name, value)
      @existing_settings[setting_name] = value
<<<<<<< HEAD
      @end_line += 1 if @end_line
=======
      if @end_line
        @end_line = @end_line + 1
      end
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    end

    def set_additional_setting(setting_name, value)
      @additional_settings[setting_name] = value
    end

    # Decrement the start and end line numbers for the section (if they are
    # defined); this is intended to be called when a setting is removed
    # from a section that comes before this section in the ini file.
<<<<<<< HEAD
    def decrement_line_nums
      @start_line -= 1 if @start_line
      @end_line -= 1 if @end_line
=======
    def decrement_line_nums()
      if @start_line
        @start_line = @start_line - 1
      end
      if @end_line
        @end_line = @end_line - 1
      end
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    end

    # Increment the start and end line numbers for the section (if they are
    # defined); this is intended to be called when an inline setting is added
    # to a section that comes before this section in the ini file.
<<<<<<< HEAD
    def increment_line_nums
      @start_line += 1 if @start_line
      @end_line += 1 if @end_line
    end
=======
    def increment_line_nums()
      if @start_line
        @start_line = @start_line + 1
      end
      if @end_line
        @end_line = @end_line + 1
      end
    end

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
  end
end
