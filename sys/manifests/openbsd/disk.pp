# == Class: sys::openbsd::disk
#
# Formats the given OpenBSD disk device with a *single* partition,
# and creates a new FFS filesystem on it.
#
# Please be *careful* with this defined type, as it will gladly reapply a disklabel
# if the existing one doesn't match.  Specifically, prior to use you should run:
#
#    # disklabel $DEVICE
#
# And ensure that the devices parameters match up with the parameters here.
# In particular, the `sectors_cylinder` parameter will need to be adjusted if
# you're not using VMware Virtual SCSI disks.
#
# === Parameters
#
# [*size*]
#  Required, the disk size in gigabytes between 1-8192 (8TB).  This is
#  necessary to compute the proper parameters for an autogenerated ASCII
#  disklabel.
#
# [*device*]
#  Required, the SCSI or IDE device name (e.g., 'sd1' or 'wd1').  Defaults
#  to the title of the resource.
#
# [*sectors_cylinder*]
#  The number of sectors/cylinder on the hard disk, defaults to 16065 (the
#  value for a VMware LSI SCSI Virtual Disk).  You will have to customize
#  this to the proper value for your hardware.
#
# [*bytes_sector*]
#  The number of bytes/sector on the hard disk, defaults to 512.
#
# [*sectors_track*]
#  The number of sectors/track on the hard disk, defaults to 63.
#
# [*tracks_cylinder*]
#  The number of tracks/cylinder on the hard disk, defaults to 255.
#
# [*timeout*]
#  The timeout for the exec resources used to apply the disklabel and format
#  the disk, defaults to 600 seconds (10 minutes).  This may need to be set
#  higher for especially large disks.
#
define sys::openbsd::disk(
  $size,
  $device           = $title,
  $sectors_cylinder = 16065,
  $bytes_sector     = 512,
  $sectors_track    = 63,
  $tracks_cylinder  = 255,
  $timeout          = 600,
) {
  validate_re($device, '^[sw]d\d+$')

  # 1GB <= size <= 8TB
  validate_integer($size, 8192, 1)

  validate_integer([$bytes_sector, $sectors_cylinder, $sectors_track,
                    $timeout, $tracks_cylinder])

  # Calculate number of sectors and cylinders.
  $sectors = ($size * 1024 * 1024 * 1024) / $bytes_sector
  $sectors_string = inline_template("<%= sprintf('%17s', @sectors) %>")
  $cylinders = $sectors / $sectors_cylinder

  # Generate ASCII disklabel file using the calculated numbers.
  $disklabel = "/root/${device}.label"
  file { $disklabel:
    ensure  => file,
    owner   => 'root',
    group   => 'wheel',
    mode    => '0644',
    content => template('sys/openbsd/disklabel.erb'),
  }

  # Partition the disk with the ASCII disklabel file.  Default to only
  # creating a *single* partition (e.g., sd1a).
  $part = 'a'
  exec { "openbsd-disklabel-${device}":
    command => "/sbin/disklabel -R ${device} ${disklabel}",
    unless  => "/sbin/disklabel ${device} | grep '^  ${part}:${sectors_string}'",
    user    => 'root',
    timeout => $timeout,
    require => File[$disklabel],
  }

  # Create new filesystem on the partition.
  #  TODO: I don't want this to be refreshonly, and would be more comfortable
  #   with finding a way to use an `unless` command.
  $partition = "${device}${part}"
  exec { "openbsd-newfs-${partition}":
    command     => "/sbin/newfs ${partition}",
    refreshonly => true,
    user        => 'root',
    timeout     => $timeout,
    subscribe   => Exec["openbsd-disklabel-${device}"],
  }
}
