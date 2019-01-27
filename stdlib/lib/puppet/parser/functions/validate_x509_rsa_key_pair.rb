<<<<<<< HEAD
module Puppet::Parser::Functions

  newfunction(:validate_x509_rsa_key_pair, :doc => <<-ENDHEREDOC
=======
#
# validate_x509_rsa_key_pair.rb
#
module Puppet::Parser::Functions
  newfunction(:validate_x509_rsa_key_pair, :doc => <<-DOC
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
    Validates a PEM-formatted X.509 certificate and RSA private key using
    OpenSSL. Verifies that the certficate's signature was created from the
    supplied key.

    Fail compilation if any value fails this check.

    validate_x509_rsa_key_pair($cert, $key)

<<<<<<< HEAD
    ENDHEREDOC
  ) do |args|
=======
    DOC
             ) do |args|
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19

    require 'openssl'

    NUM_ARGS = 2 unless defined? NUM_ARGS

<<<<<<< HEAD
    unless args.length == NUM_ARGS then
      raise Puppet::ParseError,
        ("validate_x509_rsa_key_pair(): wrong number of arguments (#{args.length}; must be #{NUM_ARGS})")
=======
    unless args.length == NUM_ARGS
      raise Puppet::ParseError,
            "validate_x509_rsa_key_pair(): wrong number of arguments (#{args.length}; must be #{NUM_ARGS})"
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
    end

    args.each do |arg|
      unless arg.is_a?(String)
        raise Puppet::ParseError, "#{arg.inspect} is not a string."
      end
    end

    begin
      cert = OpenSSL::X509::Certificate.new(args[0])
    rescue OpenSSL::X509::CertificateError => e
      raise Puppet::ParseError, "Not a valid x509 certificate: #{e}"
    end

    begin
      key = OpenSSL::PKey::RSA.new(args[1])
    rescue OpenSSL::PKey::RSAError => e
      raise Puppet::ParseError, "Not a valid RSA key: #{e}"
    end

    unless cert.verify(key)
<<<<<<< HEAD
      raise Puppet::ParseError, "Certificate signature does not match supplied key"
    end
  end

=======
      raise Puppet::ParseError, 'Certificate signature does not match supplied key'
    end
  end
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
end
