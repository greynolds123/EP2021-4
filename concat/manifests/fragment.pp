<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# == Define: concat::fragment
=======
# @summary
#   Manages a fragment of text to be compiled into a file.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
# @summary
#   Manages a fragment of text to be compiled into a file.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
#
# @param content
#   Supplies the content of the fragment. Note: You must supply either a content parameter or a source parameter.
#
# @param order
#   Reorders your fragments within the destination file. Fragments that share the same order number are ordered by name. The string
#   option is recommended.
#
# @param source
#   Specifies a file to read into the content of the fragment. Note: You must supply either a content parameter or a source parameter.
#   Valid options: a string or an array, containing one or more Puppet URLs.
#
# @param target
#   Specifies the destination file of the fragment. Valid options: a string containing the path or title of the parent concat resource.
#
define concat::fragment(
  String                             $target,
  Optional[String]                   $content = undef,
  Optional[Variant[String, Array]]   $source  = undef,
  Variant[String, Integer]           $order   = '10',
) {
  $resource = 'Concat::Fragment'

<<<<<<< HEAD
<<<<<<< HEAD
  if !(is_string($order) or is_integer($order)) {
    fail('$order is not a string or integer.')
  } elsif (is_string($order) and $order =~ /[:\n\/]/) {
    fail("Order cannot contain '/', ':', or '\n'.")
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
# @summary
#   Manages a fragment of text to be compiled into a file.
#
# @param content
#   Supplies the content of the fragment. Note: You must supply either a content parameter or a source parameter.
#
# @param order
#   Reorders your fragments within the destination file. Fragments that share the same order number are ordered by name. The string
#   option is recommended.
#
# @param source
#   Specifies a file to read into the content of the fragment. Note: You must supply either a content parameter or a source parameter.
#   Valid options: a string or an array, containing one or more Puppet URLs.
#
# @param target
#   Specifies the destination file of the fragment. Valid options: a string containing the path or title of the parent concat resource.
#
define concat::fragment(
  String                             $target,
  Optional[String]                   $content = undef,
  Optional[Variant[String, Array]]   $source  = undef,
  Variant[String, Integer]           $order   = '10',
) {
  $resource = 'Concat::Fragment'

=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  if ($order =~ String and $order =~ /[:\n\/]/) {
    fail(translate("%{_resource}['%{_title}']: 'order' cannot contain '/', ':', or '\\n'.", {'_resource' => $resource, '_title' => $title}))
  }

  if ! ($content or $source) {
    crit('No content, source or symlink specified')
  } elsif ($content and $source) {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    fail("Can't use 'source' and 'content' at the same time")
  }

  $safe_target_name = regsubst($target, '[/:~\n\s\+\*\(\)]', '_', 'GM')
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
    fail(translate("%{_resource}['%{_title}']: Can't use 'source' and 'content' at the same time.", {'_resource' => $resource, '_title' => $title}))
  }

=======
    fail(translate("%{_resource}['%{_title}']: Can't use 'source' and 'content' at the same time.", {'_resource' => $resource, '_title' => $title}))
  }

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    fail(translate("%{_resource}['%{_title}']: Can't use 'source' and 'content' at the same time.", {'_resource' => $resource, '_title' => $title}))
  }

>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  $safe_target_name = regsubst($target, '[\\\\/:~\n\s\+\*\(\)@]', '_', 'GM')

  concat_fragment { $name:
    target  => $target,
    tag     => $safe_target_name,
    order   => $order,
    content => $content,
    source  => $source,
  }
}
