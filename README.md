# chitter-challenge

![language-ruby](https://img.shields.io/badge/language-ruby-red) ![version-2.7.2](https://img.shields.io/badge/version-2.7.2-yellow) ![build](https://travis-ci.com/acavalla/chitter-challenge-2.svg?branch=master)
[![Codecov](https://codecov.io/github/acavalla/chitter-challenge-2/coverage.svg?branch=master)](https://codecov.io/github/acavalla/chitter-challenge-2?branch=master)


This is a small Twitter clone webapp.

To run:
1) Clone this repo
2) Run `bundle install`
3) Set up the databases with `rake setup`
4) Run the test suite with `rspec`
5) Run the app with `rackup -p 3000` and visit `localhost:3000` in your browser to write and delete Peeps

Domain model
![Domain model](/assets/DomainModel.jpg)

Aspects of the chitter challenge

- MVC
  - Model: Ruby, lots of self. methods
  - View: .erb files, html with interpolated ruby logic
    - Sign up/in page [being signed in is not necessary to view peeps]
    - Peeps
  - Controller: routes
- Databases [PostgreSQL]
  - Users table: email address, password, id
  - Peeps table: user_id foreign key, peep text, datetime object
- config.ru file: through which to run rackup
- Tests (RSpec)
  - Unit tests of the model's methods
  - Feature tests using capybara (or selenium webdriver for anything using js)
- Linter: Rubocop + simplecov
- Travis: CI
