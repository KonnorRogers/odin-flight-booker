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

## Database creation

```bash
rails db:migrate
```

## Database initialization

```bash
rails db:seed
```

## How to run the test suite
```bash
rails db:migrate
rails db:seed
rails test
```

## Deployment instructions

```bash
git push heroku [branch]
```

## Fun little extra items

Tailwind CSS / Webpacker are integrated in this project

## Docker integration

I have included docker support in this repo.

```bash
# builds the image
docker-compose build 

# runs the test suite
docker-compose -f docker-compose.test.yml run --rm web

# exposes the container on localhost:3000
docker-compose up
```

Optionally, I have created rake tasks for easily running these commands
```bash
rails docker:build # builds the image
rails docker:test # tests the container
rails docker:start # allows you the access the server at localhost:3000
```
