#
# validate_x509_rsa_key_pair.rb
#
module Puppet::Parser::Functions
  newfunction(:validate_x509_rsa_key_pair, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    Validates a PEM-formatted X.509 certificate and RSA private key using
    OpenSSL. Verifies that the certficate's signature was created from the
    supplied key.

    Fail compilation if any value fails this check.

    validate_x509_rsa_key_pair($cert, $key)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Validates a PEM-formatted X.509 certificate and RSA private key using
      OpenSSL. Verifies that the certficate's signature was created from the
      supplied key.

    @return
      Fail compilation if any value fails this check.

    ```validate_x509_rsa_key_pair($cert, $key)```
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97

    DOC
             ) do |args|

    require 'openssl'

    NUM_ARGS = 2 unless defined? NUM_ARGS

    unless args.length == NUM_ARGS
      raise Puppet::ParseError,
            "validate_x509_rsa_key_pair(): wrong number of arguments (#{args.length}; must be #{NUM_ARGS})"
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
      raise Puppet::ParseError, 'Certificate signature does not match supplied key'
    end
  end
end
