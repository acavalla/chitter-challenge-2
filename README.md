#chitter-challenge

Aspects of the chitter challenge

- MVC
  - Model: ruby, lots of self. methods
  - View: .erb files, html with interpolated ruby logic
    - Sign up/in page [being signed in is not necessary to view peeps]
    - Peeps
  - Controller: routes
- Databases [PostgreSQL]
  - Users table: email address, password, id
  - Peeps table: user_id foreign key, peep text, datetime object
- config.ru file: through which to run rackup
- Tests
  - Unit tests of the model's methods
  - Feature tests using capybara (or selenium webdriver for anything using js)
