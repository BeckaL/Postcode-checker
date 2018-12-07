## Overview

This is a simple programme written to check whether a given postcode is within the service area of SH:24. It is a simple command line programme, which takes the input of a postcode and outputs whether or not someone living in the postcode can access SH24's services.

The programme is run from a single class (Postcode_checker). I used TDD while writing my code to ensure quality, and my codebase has 100% test quality. I used a linter (rubocop) to ensure consistency and readability.

I used principles of object-oriented programming while writing the code - the single responsibility principle ensures that methods have only one responsibility, and are easy to read and change. I've aimed to make the code as flexible and easy to change as possible - for example, the postcode api is introduced as a default value via the initialize method, meaning that someone could easily use a different postcode api if wanted.

Also included in this repo is html and css code to replicate the registration journey navigation bar - see the HTML-and-CSS-challenge folder.

## Working on or running the code

Clone this respository

Change into the directory from the command line

``cd postcode-checker``

Install the gems from the command line:

``bundle install``

### Running the tests

Run rspec from the command line:

``rspec``

### Running linting

Run rubocop from the command line:

``rubocop``

### Running the programme

Access IRB from the command line:

``irb``

Require in the postcode_checker_file, make a new instance of the postcode checker class and input a postcode to see whether it can be serviced ('true' means it is in a serviceable area, and 'false' means it is not):

```
$ require './lib/postcode_checker.rb'
$ checker = Postcode_checker.new
$ checker.serviceable?('SE17JU')
=> true
$ checker.serviceable?('SW10AA')
=> false
```

## Future Development

Ensure that the programme works if the LSOA name has a space in.

Add in a basic web interface.
