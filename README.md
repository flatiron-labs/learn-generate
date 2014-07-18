# Flatiron Lab Generator

A gem for generating labs in the format/style we use for making labs at the Flatiron School.

## Installation

$ gem install flatiron-lab-generator

## Usage

1. Generate a new personal API key by visiting https://github.com/settings/applications and choosing 'Generate New Token'.

2. `flatiron-lab-generator [lab-type]`

3. On first run, you will be prompted to enter your GitHub username and newly generated API key to be authorized to push to the flatiron-school-curriculum organization.

## Lab Types

Lab types have been outlined here in the [Ruby Lab Style Guide](https://github.com/flatiron-school-curriculum/ruby-lab-style-guide#topics)

These are the Lab Types:

* procedural-ruby-lab-template
* command-line-app-lab-template
* SQL-lab-template
* activerecord-template
* rake-lab-template
* erb-static-site-lab-template
* rack-lab-template
* sinatra-no-db-lab-template 
* sinatra-lab-template

We have the [flatiron-rails gem](https://github.com/flatiron-school/flatiron-rails) for generating Rails labs.