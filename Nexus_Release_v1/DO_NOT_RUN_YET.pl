#!/usr/bin/perl

###############################
# DO NOT RUN THIS FILE DIRECTLY
###############################
use strict;
use warnings;

# Detect the user's distribution
my $distro;
if (-e "/etc/os-release") {
    $distro = `awk -F= '/^ID=/{print \$2}' /etc/os-release`;
    chomp($distro);
} elsif (-e "/etc/release") {
    $distro = `head -n1 /etc/release | awk '{print \$1}'`;
    chomp($distro);
} else {
    die "Unsupported distribution";
}

# Set the package manager command based on the detected distribution
my $package_manager;
if ($distro eq "arch") {
    $package_manager = "pacman -S";
} elsif ($distro eq "debian") {
    $package_manager = "apt-get install";
} elsif ($distro eq "freebsd") {
    $package_manager = "pkg install";
} elsif ($distro eq "solaris") {
    $package_manager = "pkgutil -y -i";
} else {
    die "Unsupported distribution";
}

# forgot, I think it downloads the packages
system("$package_manager lua cmake python");
