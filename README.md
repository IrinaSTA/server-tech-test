## Bank Tech Test

This is an http server written from scratch in Ruby. It can do two things:
- when it receives a request on http://localhost:4000/set?somekey=somevalue,
  it stores the passed key and value in memory
- when it receives a request on http://localhost:4000/get?key=somekey,
  it returns the value stored at somekey

## How to Run It

- fork and clone this repo
- run bundle install from root directory
- from root directory, run ```ruby app.rb``` in the terminal
- from a browser window, go to ```localhost:4000/set?somekey=somevalue``` and
  then to ```localhost:4000/set?key=somekey```

## How to Test It

- From the terminal, run: ```rspec spec --format documentation```

## My Approach

My code has three parts:
- server.rb - this is an http server written in Ruby. It:
  - listens for a request from the browser
  - parses the request and passes it to controller
  - returns response from controller to the browser
- controller.rb - this is a controller written in Ruby. It:
  - determines the right response based on request
  - returns response
- model.rb - contains business logic written in Ruby. It:
  - stores passed key and value
  - returns stores key and value

## Dependencies

I've used the following gems:
- Rspec for unit testing
- Capybara for feature testing
- Simplecov for test coverage
- Rubocop for linting
