<<<<<<< HEAD
# Manifest creating multiple ini_settings
class create_multiple_ini_settings {
  if $facts['osfamily'] == 'windows' {
    $defaults = { 'path' => 'C:/tmp/foo.ini' }
  } else {
    $defaults = { 'path' => '/tmp/foo.ini' }
  }

  $example = {
    'section1' => {
      'setting1'  => 'value1',
      'settings2' => {
        'ensure' => 'absent'
      }
    }
  }

  create_ini_settings($example, $defaults)
=======
class create_multiple_ini_settings {

$defaults = { 'path' => '/tmp/foo.ini' }
$example = {
  'section1' => {
    'setting1'  => 'value1',
    'settings2' => {
      'ensure' => 'absent'
    }
  }
}
create_ini_settings($example, $defaults)

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
}

