Builds Ruby versions in a Docker container using [ruby-build](https://github.com/sstephenson/ruby-build) and packages them using [FPM](https://github.com/jordansissel/fpm)

Currently only supports Ubuntu 14.04, but could easily be adapted to other distros / versions.

## Usage

    RUBY_VERSION=2.1.5 rake

## Requirements

The host system must have already have Ruby & Rake installed.

