# Odin Flight Booker

## Purpose

A rails app for booking flights.
This is merely a sample app to show how nested attributes would work

[The Odin Project flight
booker link](https://www.theodinproject.com/courses/ruby-on-rails/lessons/building-advanced-forms?ref=lnav#assignment)

## Ruby version

- Ruby 2.6.2

## System dependencies

- Ruby 2.6.2
- Rails 5.2.3
- Sqlite3

## Getting Started

### Local development

```bash
git clone https://github.com/ParamagicDev/odin-flight-booker.git
cd odin-flight-booker
bundle install
yarn install
rails db:migrate
rails db:seed
rails server
```

### Deployment to heroku

```bash
https://github.com/ParamagicDev/odin-flight-booker.git
cd odin-flight-booker
bundle install
yarn install
heroku create
git push heroku master
heroku run rails db:migrate
heroku run rails db:seed
heroku open
```

## Database creation

```bash
rails db:migrate
rails db:seed
```

## How to run the test suite
```bash
bundle install
rails db:migrate
rails test
```

## Fun little extra items

Tailwind CSS / Webpacker are integrated in this project
