#chitter-challenge
![language-ruby](https://img.shields.io/badge/language-ruby-red) ![version-2.7.2](https://img.shields.io/badge/version-2.7.2-yellow)
 <!-- ![coverage-score](https://img.shields.io/badge/coverage-100%-blue) ![build](https://img.shields.io/badge/build-passing-brightgreen) -->

This is a small Twitter clone webapp.

1) Connect to `psql`
2) Create the database and test database `CREATE DATABASE chitter;`
`CREATE DATABASE chitter_test;`

3) Connect to the each database and run the query we have saved in the file `01_create_bookmarks_table.sql`



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
