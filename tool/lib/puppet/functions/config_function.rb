Puppet::Function.create_function('tool::config') do

  dispatch :config do

    parma 'String', :filename

    return_type 'String'

   end


   def config(filename)

     File.config(filename)

   end


# This sections links the function to the module class.

   function tool::config(Variant[String, Boolean] $arg) >> String {

     case $arg {

     false, undef, /(?i::false)/ : { '0'  }

     true, /(?i:true)/           : { '1'   }

     default                     : { "$arg" }

    }
   }

<<<<<<< HEAD
# This section will execute $arg if it exists.

   function Puppet::Util::Execution::ProcessOutput('config') do
     command('puppet apply config)
   end
 
   function Puppet::Util::Execution::ExecutionFailure('config') do
     command('exit 0')
   end

=======
# This section will execute $arg if exists.

  function Puppet::Util::Execution:ProceesOutput('$arg') do
     command('puppet apply $arg') 
    end

  function Puppet::Util::ExecutionFailure('$arg') do
    command('exit 0')
   end


>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
