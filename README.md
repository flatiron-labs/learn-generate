# Flatiron Lab Generator

A gem for generating labs in the format/style we use for making labs at the Flatiron School.

## Dependencies

Assumes installation of git.

## Installation

Visit [http://gems.flatironschool.com/](http://gems.flatironschool.com/)

## Usage

`flatiron-lab-generator <lab-type> <lab-name>`

### With git

Execute as `flatiron-lab-generator <lab-type> <lab-name> -g` if you want your template to be created with an initialized git repository.

## Lab Types

Lab types have been outlined in the [Curriculum Style Guide](https://github.com/flatiron-school-curriculum/curriculum-style-guide/blob/master/lab-templates.md)

These are the Lab Types:

* fundamental-ruby
* command-line
* SQL
* activerecord
* rake
* erb-static-site
* rack
* sinatra-classic
* sinatra-mvc
* js
* front-end
* kids

We have the [flatiron-rails gem](https://github.com/flatiron-school/flatiron-rails) for generating Rails labs.

## Lab Name

The lab-name refers to the name of the lab (example: Sinatra-ORM-Halloween).

## Reposit

Logan made an awesome gem that creates a remote git repository from the command line. It's called [Reposit](https://github.com/loganhasson/reposit). After installing that and following the setup steps, run `reposit <lab name> -o flatiron-school-curriculum`.