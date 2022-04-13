# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## New Features

- Added a Sold Out Badge to Product Cards to Show when Sold Out
- Added Administration Login for Creating/Destroying Products/Categories
- Added User Signup/Login Functionality
- Added About Page
- Added Categories Page to Admin Dashboard

## Screenshots

#### Homepage
!["Homepage"](https://github.com/OfLena/jungle-rails/blob/master/docs/Homepage.png?raw=true)

#### Checkout
!["Checkout"](https://github.com/OfLena/jungle-rails/blob/master/docs/Checkout%20Cart.png?raw=true)

#### Order Completion
!["Order completion"](https://github.com/OfLena/jungle-rails/blob/master/docs/Order%20Completion.png?raw=true)

#### Admin Authentification
!["Admin login"](https://github.com/OfLena/jungle-rails/blob/master/docs/Admin%20Authentification.png?raw=true)

#### Admin Add/Delete Products
!["Admin capabilities"](https://github.com/OfLena/jungle-rails/blob/master/docs/Admin%20Add:Delete%20Products.png?raw=true)


