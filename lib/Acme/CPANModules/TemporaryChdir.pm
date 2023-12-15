package Acme::CPANModules::TemporaryChdir;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $LIST = {
    summary => 'List of modules to change directory temporarily',
    description => <<'MARKDOWN',

Changing directory can be tricky if you are doing it in a transaction or inside
a routine where you need to restore the previous working directory whether your
main action succeeds or not. Forgetting doing it and it will cause unexpected
behavior for the user calling your code.

Restoring previous directory can be as simple as:

    use Cwd qw(getcwd);

    my $prevcwd = getcwd();
    eval {
        # do some stuffs that might die ...
    };
    # check success status ...
    chdir $prevcwd or die "Can't chdir back to '$prevcwd': $!";

but it can get tedious. Some modules can help. These modules employ one of
several mechanisms provided by Perl:

1) Tied scalar, where reading from the scalar retrieves the current working
directory and writing to it changes the working directory. The user can set the
magic variable locally and have Perl restore the old value. Modules that use
this technique include: <pm:File::chdir>.

2) An object, where its constructor records the current working directory and
its DESTROY restores the previously recorded working directory. The user can
create a lexically scoped object that can change directory but restores the
previous working directory when the object goes out of scope. Modules that use
this technique include: <pm:File::pushd> and <pm:Dir::TempChdir>.

MARKDOWN
    entries => [
        {
            module => 'File::chdir',
        },
        {
            module => 'File::pushd',
        },
        {
            module => 'Dir::TempChdir',
        },
    ],
};

1;
# ABSTRACT:
