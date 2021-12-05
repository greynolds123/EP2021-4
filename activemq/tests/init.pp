node default {
  notify { 'alpha': }
<<<<<<< HEAD
<<<<<<< HEAD

  -> class  { 'java':
    distribution => 'jdk',
    version      => 'latest',
  }

  -> class  { 'activemq':
    webconsole => true,
  }

  -> notify { 'omega': }
=======
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  ->
  class  { 'java':
    distribution => 'jdk',
    version      => 'latest',
  }
  ->
  class  { 'activemq':
    webconsole => true,
  }
  ->
  notify { 'omega': }
<<<<<<< HEAD
>>>>>>> c9b52c6393265c3a51bd8b3201b3bfbe07fcc044
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
}
