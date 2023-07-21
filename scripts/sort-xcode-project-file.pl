#!/usr/bin/env perl

# Taken from the apple webkit project:
# Source: https://github.com/WebKit/webkit/blob/master/Tools/Scripts/sort-Xcode-project-file

# Sorts all files in the XCode Project alphabetically
# Call with: pearl sort-Xcode-project-file <ProjectFile>

use strict;
use warnings;

use File::Basename;
use File::Spec;
use File::Temp qw(tempfile);
use Getopt::Long;

sub sortChildrenByFileName($$);
sub sortFilesByFileName($$);

# Files (or products) without extensions
my %isFile = map { $_ => 1 } qw(
    create_hash_table
    jsc
    minidom
    testapi
    testjsglue
);

my $printWarnings = 1;
my $showHelp;

my $getOptionsResult = GetOptions(
    'h|help'         => \$showHelp,
    'w|warnings!'    => \$printWarnings,
);

if (scalar(@ARGV) == 0 && !$showHelp) {
    print STDERR "ERROR: No Xcode project files (project.pbxproj) listed on command-line.\n";
    undef $getOptionsResult;
}

if (!$getOptionsResult || $showHelp) {
    print STDERR <<__END__;
Usage: @{[ basename($0) ]} [options] path/to/project.pbxproj [path/to/project.pbxproj ...]
  -h|--help           show this help message
  -w|--[no-]warnings  show or suppress warnings (default: show warnings)
__END__
    exit 1;
}

for my $projectFile (@ARGV) {
    if (basename($projectFile) =~ /\.xcodeproj$/) {
        $projectFile = File::Spec->catfile($projectFile, "project.pbxproj");
    }

    if (basename($projectFile) ne "project.pbxproj") {
        print STDERR "WARNING: Not an Xcode project file: $projectFile\n" if $printWarnings;
        next;
    }

    # Grab the mainGroup for the project file.
    my $mainGroup = "";
    open(IN, "< $projectFile") || die "Could not open $projectFile: $!";
    while (my $line = <IN>) {
        $mainGroup = $2 if $line =~ m#^(\s*)mainGroup = ([0-9A-F]{24}( /\* .+ \*/)?);$#;
    }
    close(IN);

    my ($OUT, $tempFileName) = tempfile(
        basename($projectFile) . "-XXXXXXXX",
        DIR => dirname($projectFile),
        UNLINK => 0,
    );

    # Clean up temp file in case of die()
    $SIG{__DIE__} = sub {
        close(IN);
        close($OUT);
        unlink($tempFileName);
    };

    my @lastTwo = ();
    open(IN, "< $projectFile") || die "Could not open $projectFile: $!";
    while (my $line = <IN>) {
        if ($line =~ /^(\s*)files = \(\s*$/) {
            print $OUT $line;
            my $endMarker = $1 . ");";
            my @files;
            while (my $fileLine = <IN>) {
                if ($fileLine =~ /^\Q$endMarker\E\s*$/) {
                    $endMarker = $fileLine;
                    last;
                }
                push @files, $fileLine;
            }
            print $OUT sort sortFilesByFileName @files;
            print $OUT $endMarker;
        } elsif ($line =~ /^(\s*)children = \(\s*$/) {
            print $OUT $line;
            my $endMarker = $1 . ");";
            my @children;
            while (my $childLine = <IN>) {
                if ($childLine =~ /^\Q$endMarker\E\s*$/) {
                    $endMarker = $childLine;
                    last;
                }
                push @children, $childLine;
            }
            if ($lastTwo[0] =~ m#^\s+\Q$mainGroup\E = \{$#) {
                # Don't sort mainGroup
                print $OUT @children;
            } else {
                print $OUT sort sortChildrenByFileName @children;
            }
            print $OUT $endMarker;
        } else {
            print $OUT $line;
        }

        push @lastTwo, $line;
        shift @lastTwo if scalar(@lastTwo) > 2;
    }
    close(IN);
    close($OUT);

    unlink($projectFile) || die "Could not delete $projectFile: $!";
    rename($tempFileName, $projectFile) || die "Could not rename $tempFileName to $projectFile: $!";
}

exit 0;

sub sortChildrenByFileName($$)
{
    my ($a, $b) = @_;
    my $aFileName = $1 if $a =~ /^\s*[A-Z0-9]{24} \/\* (.+) \*\/,$/;
    my $bFileName = $1 if $b =~ /^\s*[A-Z0-9]{24} \/\* (.+) \*\/,$/;
    my $aSuffix = $1 if $aFileName =~ m/\.([^.]+)$/;
    my $bSuffix = $1 if $bFileName =~ m/\.([^.]+)$/;
    if ((!$aSuffix && !$isFile{$aFileName} && $bSuffix) || ($aSuffix && !$bSuffix && !$isFile{$bFileName})) {
        return !$aSuffix ? -1 : 1;
    }
    if ($aFileName =~ /^UnifiedSource\d+/ && $bFileName =~ /^UnifiedSource\d+/) {
        my $aNumber = $1 if $aFileName =~ /^UnifiedSource(\d+)/;
        my $bNumber = $1 if $bFileName =~ /^UnifiedSource(\d+)/;
        return $aNumber <=> $bNumber;
    }
    return lc($aFileName) cmp lc($bFileName);
}

sub sortFilesByFileName($$)
{
    my ($a, $b) = @_;
    my $aFileName = $1 if $a =~ /^\s*[A-Z0-9]{24} \/\* (.+) in /;
    my $bFileName = $1 if $b =~ /^\s*[A-Z0-9]{24} \/\* (.+) in /;
    if ($aFileName =~ /^UnifiedSource\d+/ && $bFileName =~ /^UnifiedSource\d+/) {
        my $aNumber = $1 if $aFileName =~ /^UnifiedSource(\d+)/;
        my $bNumber = $1 if $bFileName =~ /^UnifiedSource(\d+)/;
        return $aNumber <=> $bNumber;
    }
    return lc($aFileName) cmp lc($bFileName);
}