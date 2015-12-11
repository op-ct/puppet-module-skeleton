This module has grown over time based on a range of contributions from people
using it. If you follow the [SIMP Contribution Guidelines](https://simp-project.atlassian.net/wiki/display/SD/Contributing+to+SIMP),
your patch will likely make it into a release a little quicker.


## Contributing
Below is a summary of the contribution workflow:

1. [Fork](https://help.github.com/articles/fork-a-repo/) the project's repository on GitHub.
2. Make a [Feature branch](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow) for your changes.
3. Make your changes!
4. Save your changes as a **single commit** ([squash](https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History#Squashing-Commits) multiple commits, if necessary)
5. Push your changes up to GitHub.
6. Submit a [Pull Request](https://help.github.com/articles/using-pull-requests/) (PR) with your changes.
7. [Travis CI](https://travis-ci.org/simp/) will run tests on your PR. Make sure these tests pass.
8. Your changes will be imported by an admin in [GerritHub](https://review.gerrithub.io/#/q/is:open+project:%255Esimp.*) and your code will be reviewed. 
9. After passing review in GerritHub, your code will be accepted and merged.

For more details, please consult the [SIMP Contribution Guidelines](https://simp-project.atlassian.net/wiki/display/SD/Contributing+to+SIMP).


## Dependencies

The testing and development tools have a bunch of dependencies,
all managed by [Bundler](http://bundler.io/) according to the
[Puppet support matrix](http://docs.puppetlabs.com/guides/platforms.html#ruby-versions).

By default the tests use a baseline version of Puppet.

If you have Ruby 2.x or want a specific version of Puppet,
you must set an environment variable such as:

    export PUPPET_VERSION="~> 3.2.0"

Install the dependencies like so...

    bundle install

## Syntax and style

The test suite will run [Puppet Lint](http://puppet-lint.com/) and
[Puppet Syntax](https://github.com/gds-operations/puppet-syntax) to
check various syntax and style things. You can run these locally with:

    bundle exec rake lint
    bundle exec rake syntax

## Running the unit tests

The unit test suite covers most of the code, as mentioned above please
add tests if you're adding new functionality. If you've not used
[rspec-puppet](http://rspec-puppet.com/) before then feel free to ask
about how best to test your new feature. Running the test suite is done
with:

    bundle exec rake spec

Note also you can run the syntax, style and unit tests in one go with:

    bundle exec rake test

### Automatically run the tests

During development of your puppet module you might want to run your unit
tests a couple of times. You can use the following command to automate
running the unit tests on every change made in the manifests folder.

    bundle exec guard

## Integration tests

The unit tests just check the code runs, not that it does exactly what
we want on a real machine. For that we're using
[Beaker](https://github.com/puppetlabs/beaker).

Beaker fires up a new virtual machine (using Vagrant) and runs a series of
simple tests against it after applying the module. You can run our
Beaker tests with:

    bundle exec rake acceptance

This will use the host described in `spec/acceptance/nodeset/default.yml`
by default. To run against another host, set the `BEAKER_set` environment
variable to the name of a host described by a `.yml` file in the
`nodeset` directory. For example, to run against CentOS 6.6:

    BEAKER_set=centos-66-x64 bundle exec rake acceptance

If you don't want to have to recreate the virtual machine every time you
can use `BEAKER_destroy=no` and `BEAKER_provision=no`. On the first run you will
at least need `BEAKER_provision` set to yes (the default). The Vagrantfile
for the created virtual machines will be in `.vagrant/beaker_vagrant_files`.
