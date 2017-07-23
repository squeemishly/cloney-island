# Cloney Island

![alt text](http://i.imgur.com/WlFozNA.png)

## Description

A remake of [Sygic Travel](https://travel.sygic.com), visitors can click on a city and see tourist attractions in that city, ranked by prominence. Visitors can also click on the filter navigation links to sort into restaurants, libraries, museums, and more. To plan a trip, visitors can sign in, enter their trip details, and then start planning their itineraries for each day of their holiday by adding attractions to their trip. Vendor accounts have the ability to create "Tours" which, ultimately, visitors will be able to view, review, and 'buy.' Cloney Island also has admin accounts that can sign up vendors, disable user accounts, and access high level stats about users.

## Stack

This site is built with Javascript, SASS, CSS, Postgresql, Rails 5.1.2, Ruby version 2.4.1, Google Places API, Google Maps API & Twilio API.

## Schema

Here's a look at the relationships in our database: 

![alt text](http://i.imgur.com/8aGT3nP.png)

## Heroku

  * [Visit us on Heroku](https://morning-thicket-74383.herokuapp.com/)

## Local Install

  ### You Need:
  * [Rails version 5.1](http://installrails.com/)

  * [Ruby version 2.4.1](https://www.ruby-lang.org/en/documentation/installation/)

To run locally:
  * clone this repo.
  * cd into it
  * ```bundle```
  * ```bundle exec figaro install```
  * There are several required environmental variables. Ask project contributors for required values to add into application.yml.
  * ```rake db:setup```
  * ```rake db:seed```
  * ```rails server```
  * go to ```localhost:3000``` and click on a city

## Testing Suite
* ```rspec```
