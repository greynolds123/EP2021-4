<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
# class Specinfra::Command::Windows::Base::File
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
# class Specinfra::Command::Windows::Base::File
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
# class Specinfra::Command::Windows::Base::File
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
# class Specinfra::Command::Windows::Base::File
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
class Specinfra::Command::Windows::Base::File < Specinfra::Command::Windows::Base
  class << self
    def check_is_owned_by(file, owner)
      Backend::PowerShell::Command.new do
        exec "if((Get-Item '#{file}').GetAccessControl().Owner -match '#{owner}'
          -or ((Get-Item '#{file}').GetAccessControl().Owner -match '#{owner}').Length -gt 0){ exit 0 } else { exit 1 }"
      end
    end
  end
end
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD


=======
# class Specinfra::Command::Base::File
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
# class Specinfra::Command::Base::File
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
# class Specinfra::Command::Base::File
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
# class Specinfra::Command::Base::File
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
class Specinfra::Command::Base::File < Specinfra::Command::Base
  class << self
    def get_content(file)
      "cat '#{file}' 2> /dev/null || echo -n"
    end
  end
end
