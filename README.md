# SIMP puppet module skeleton
[![Build Status](https://travis-ci.org/simp/puppet-module-skeleton.svg?branch=master)](https://travis-ci.org/simp/puppet-module-skeleton)

<!-- vim-markdown-toc GFM -->

* [Compatibility](#compatibility)
* [Usage](#usage)
  * [Generating a module](#generating-a-module)
    * [Rake tasks](#rake-tasks)
  * [Testing the module skeleton](#testing-the-module-skeleton)
* [Thanks](#thanks)

<!-- vim-markdown-toc -->

This is a _very_ opinionated Puppet module skeleton, forked from the fantastic
[garethr/puppet-module-skeleton](https://github.com/garethr/puppet-module-skeleton).
It provides a template for the `puppet module generate` tool to generate new
modules targeted toward inclusion with [SIMP](https://simp-project.com),
a compliance-management framework built on Puppet.

## Compatibility

* The module conventions were last updated for **SIMP 6.4.0-0**
* The default Puppet version is ~> **5.5.0**
* The `Gemfile.lock` was last generated with **Ruby 2.4.5**

## Usage

### Generating a module

* Generate your new module structure like so:

  ```shell
  rake generate[<forgename>-<modulename>]
  ```

* Once you have your module then install the development dependencies:

  ```shell
  cd <modulename>
  bundle install
  ```

#### Rake tasks

You should now have a bunch of rake commands to help with your module
development:

```shell
rake acceptance                                # Run acceptance tests
rake beaker                                    # Run beaker acceptance tests
rake beaker:suites[set,node]                   # Run beaker suites acceptance tests
rake beaker:ssh[set,node]                      # Try to use vagrant to login to the Beaker node
rake beaker:sets                               # List available beaker nodesets
rake build                                     # Build puppet module package
rake build:pdk                                 # Build Puppet module with PDK
rake build:pmt                                 # Build Puppet module package with PMT (Puppet ...
rake clean                                     # Clean a built module package / Remove an...
rake clobber                                   # Remove any generated file / Clobber buil...
rake contributors                              # Populate CONTRIBUTORS file
rake coverage                                  # Generate code coverage information
rake help                                      # Display the list of available rake tasks
rake lint                                      # Run puppet-lint
rake metadata                                  # Validate metadata.json file
rake pkg:rpm[chroot,unique,snapshot_release]   # Build the pupmod-simp-simplib RPM
rake pkg:scrub[chroot,unique]                  # Scrub the pupmod-simp-simplib mock build...
rake pkg:srpm[chroot,unique,snapshot_release]  # Build the pupmod-simp-simplib SRPM
rake pkg:tar[snapshot_release]                 # Build the pupmod-simp-simplib tar package
rake spec                                      # Run spec tests in a clean fixtures direc...
rake spec_clean                                # Clean up the fixtures directory
rake spec_prep                                 # Create the fixtures directory
rake spec_standalone                           # Run spec tests on an existing fixtures d...
rake syntax                                    # Syntax check Puppet manifests and templates
rake syntax:hiera                              # Syntax check Hiera config files
rake syntax:manifests                          # Syntax check Puppet manifests
rake syntax:templates                          # Syntax check Puppet templates
rake test                                      # Run syntax, lint, and spec tests
rake validate                                  # Check syntax of Ruby files and call :syn...
```

Of particular interest should be:

* `rake beaker:suites` - run all beaker [acceptance test suites](https://github.com/simp/rubygem-simp-beaker-helpers#suites)
* `rake test`          - run syntax, lint, and unit tests, and validate metadata
* `rake spec`          - run unit tests
* `rake lint`          - checks against the puppet style guide
* `rake syntax`        - to check you have valid puppet and erb syntax


### Testing the module skeleton

To test the generator and the generated skeleton:

```shell
# runs `rake test` (syntax, validation, lint, and spec tests)
bundle exec rake test
```

To run the acceptance suite `rake beaker:suites[default]` after the normal
tests:

```shell
SKELETON_beaker_suites=yes bundle exec rake test
```

By default, the tests remove the generated `Gemfile.lock` to permit matrixed
tests where `$PUPPET_VERSION` is not `~>5.5.0`.  To keep the generated
`Gemfile.lock`, include the environment variable:

```shell
SKELETON_keep_gemfile_lock=yes
```

## Thanks

- This module was forked from the
  [garethr/puppet-module-skeleton](https://github.com/garethr/puppet-module-skeleton).
- A few other bits came from another excellent module skeleton from
  [spiette](https://github.com/spiette/puppet-module-skeleton).
