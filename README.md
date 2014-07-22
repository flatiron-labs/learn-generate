# Flatiron Lab Generator

A gem for generating labs in the format/style we use for making labs at the Flatiron School.

## Dependencies

Assumes installation of git. The gem initializes an empty git repository. Make sure you have git installed first before using the gem.

## Installation

$ gem install flatiron-lab-generator

## Usage

`flatiron-lab-generator <lab-type> <lab-name>`

## Lab Types

Lab types have been outlined here in the [Ruby Lab Style Guide](https://github.com/flatiron-school-curriculum/ruby-lab-style-guide#topics)

These are the Lab Types:

* procedural-ruby
* command-line
* SQL
* activerecord
* rake
* erb-static-site
* rack
* sinatra-no-db 
* sinatra

We have the [flatiron-rails gem](https://github.com/flatiron-school/flatiron-rails) for generating Rails labs.

## Lab Name

The lab-name refers to the name of the lab (example: Sinatra-ORM-Halloween).

## Reposit

Logan made an awesome gem that creates a remote git repository from the command line. It's called [Reposit](https://github.com/loganhasson/reposit). After installing that and following the setup steps, run `reposit <lab name> -o flatiron-school-curriculum`.