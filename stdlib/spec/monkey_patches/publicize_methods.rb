<<<<<<< HEAD
#! /usr/bin/env ruby -S rspec
# Some monkey-patching to allow us to test private methods.
class Class
    def publicize_methods(*methods)
        saved_private_instance_methods = methods.empty? ? self.private_instance_methods : methods

        self.class_eval { public(*saved_private_instance_methods) }
        yield
        self.class_eval { private(*saved_private_instance_methods) }
    end
=======
# Some monkey-patching to allow us to test private methods.
class Class
  def publicize_methods(*methods)
    saved_private_instance_methods = methods.empty? ? private_instance_methods : methods

    class_eval { public(*saved_private_instance_methods) }
    yield
    class_eval { private(*saved_private_instance_methods) }
  end
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
end
