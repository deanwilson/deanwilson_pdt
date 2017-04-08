# Introduction

Welcome to a repository containing some example custom Puppet data types
that you can use in your own code base to ensure the values you pass
around are correct ones.

In Puppet 4 and above all values in puppet have a type. While these can,
at their very basic level, be used to ensure that a value is a number or
is one of a few allowed options they can also be extended and refined to
allow more specific checking of values. For example you can require that
a string matches one of your internal product names or that all IP
addresses are in your private subnets. The custom data types in this
module are experiments I've tried in my own modules to help classes
become more focused, and restrictive, in the values they'll except.

While you can install this module and use the data types it's probably
more useful as a selection of small examples that you can name space
into your own local data types module.

## Using the types

Once you've installed the module you can use the data types in your own
classes like this:

    class ubuntu_code(
      Deanwilson_pdt::Ubuntucodename $ubuntu_code_name,
    ) {

      notify { "Hello from $ubuntu_code_name": }

    }

Then when you call the type with an invalid value:

    class { 'ubuntu_code':
      ubuntu_code_name => 'trusted',
    }

Puppet raises an evaluation error. In this case our data type is an `Enum` so
the output shows the possible values.

    Error: Evaluation Error: Error while evaluating a Resource
    Statement, Class[Ubuntu_code]: parameter 'ubuntu_code_name' expects a
    match for Deanwilson_pdt::Ubuntucodename = Enum['breezy', 'dapper',
    'edgy', 'feisty', 'gutsy', 'hardy', 'hoary', 'intrepid', 'jaunty',
    'karmic', 'lucid', 'maverick', 'natty', 'oneiric', 'precise',
    'quantal', 'raring', 'saucy', 'trusty', 'utopic', 'vivid', 'warty',
    'wily', 'xenial', 'yakkety', 'zesty'], got 'trusted' at /mypath/ubuntu-
    codename.pp:9:1 on node puppet245


## Types

The types themselves can be found in the `types` directory.

 * Deanwilson_pdt::AWSARN -- a naive matcher for Amazon Resource Names (ARNs)

 * Deanwilson_pdt::Gpgkeyid -- matches 40 character alphanumeric GPG key IDs

 * Deanwilson_pdt::Ubuntucodename -- matches a valid Ubuntu distribution
     codename. Examples are `trusty` and `xenial`.

## Installation

You can install this module from [PuppetForge](https://forge.puppet.com/):

    puppet module install deanwilson-deanwilson_pdt

## Notes

Including my own name in the module code feels very narcissistic but at
the moment that seems to be the best way to name space the types to
avoid collisions. The other issue is that the first part of the
datatypes name need to match the module name, which limits what you can
sensibly call the module and still use it in yuor day to day code.

In actual usage I'd probably expect a local data types module that cherry picks
from a number of other type repositories and has a short, easy to use name. In
this module I've veered towards an awkward but long and expicit name.

### License

Apache 2.0 - [Dean Wilson](https://www.unixdaemon.net)
