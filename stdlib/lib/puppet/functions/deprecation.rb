<<<<<<< HEAD
# Function to print deprecation warnings, Logs a warning once for a given key. The uniqueness key - can appear once. The msg is the message text including any positional information that is formatted by the user/caller of the method  It is affected by the puppet setting 'strict', which can be set to :error (outputs as an error message), :off (no message / error is displayed) and :warning (default, outputs a warning)  *Type*: String, String.
=======
# Function to print deprecation warnings, Logs a warning once for a given key. The uniqueness key - can appear once.
# The msg is the message text including any positional information that is formatted by the user/caller of the method.
# It is affected by the puppet setting 'strict', which can be set to :error (outputs as an error message),
#   :off (no message / error is displayed) and :warning (default, outputs a warning)  *Type*: String, String.
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
#

Puppet::Functions.create_function(:deprecation) do
  dispatch :deprecation do
    param 'String', :key
    param 'String', :message
  end

  def deprecation(key, message)
<<<<<<< HEAD
    # depending on configuration setting of strict
    case Puppet.settings[:strict]
    when :off
      # do nothing
    when :error
      fail("deprecation. #{key}. #{message}")
=======
    if defined? Puppet::Pops::PuppetStack.stacktrace
      stacktrace = Puppet::Pops::PuppetStack.stacktrace()
      file = stacktrace[0]
      line = stacktrace[1]
      message = "#{message} at #{file}:#{line}"
    end
    # depending on configuration setting of strict
    case Puppet.settings[:strict]
    when :off # rubocop:disable Lint/EmptyWhen : Is required to prevent false errors
      # do nothing
    when :error
      raise("deprecation. #{key}. #{message}")
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
    else
      unless ENV['STDLIB_LOG_DEPRECATIONS'] == 'false'
        Puppet.deprecation_warning(message, key)
      end
    end
  end
end
