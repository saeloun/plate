[![CircleCI](https://circleci.com/gh/saeloun/plate.svg?style=svg&circle-token=922616109594a8a6450d7c8d31edd68f8c9e53eb)](https://circleci.com/gh/saeloun/plate)

### Demo

http://railstemplate.herokuapp.com

### Local Development Setup

#### Prerequisites:
##### General Software Requirements
- Install the latest [Node.js](https://nodejs.org) version. Make sure that [npm](https://www.npmjs.com/) is installed with it as well.
- Install [yarn](https://yarnpkg.com/en/docs/install)
- Install [Ruby version 2.7.2](https://www.ruby-lang.org/en/news/2019/10/01/ruby-2-6-5-released/)
- Install [Postgres](https://postgresapp.com)
- Install [Redis](https://redis.io/download)
- Install [ImageMagick](https://imagemagick.org/script/download.php)

##### Installation steps on mac OS
- Install [Homebrew](https://brew.sh).
- Install the latest [Node.js](https://nodejs.org) version. Make sure that [npm](https://www.npmjs.com/) is installed with it as well.
- Install [RVM](https://rvm.io/rvm/install)
- Install Ruby 2.7.2 using RVM
  ```
  rvm install 2.7.2
  ```

  To make 2.7.2 as default and current version execute
  ```
  rvm --default use 2.7.2
  ```
- Install PostgreSQL using Homebrew.
   ```
   brew install postgresql
   ```

   Once postgresql is installed to start the server daemon run
   ```
   brew services start postgresql
   ```
- Install Redis
  ```
  brew install redis
  ```

  Launch Redis server daemon through Homebrew
  ```
  brew services start redis
  ```

  To ensure server is up, ping the server and confirm that we get a response.
  ```
  redis-cli ping
  PONG
  ```
- Install Yarn
  ```
  brew install yarn
  ```
- Install ImageMagick
  ```
  brew install imagemagick vips
  ```

  We are using [image_processing](https://github.com/janko/image_processing) gem for file uploads.
  Need to install this so that images are rendered locally.

#### Creating a new app

```bash
rails new myapp -d postgresql -m https://raw.githubusercontent.com/ashwin47/plate/main/template.rb
```

Or if you have downloaded this repo, you can reference template.rb locally:

```bash
rails new myapp -d postgresql -m template.rb
```

❓Having trouble? Try adding `DISABLE_SPRING=1` before `rails new`. Spring will get confused if you create an app with the same name twice.


#### Setup database

  Update `config/database.yml` with your database credentials

  `rails db:create && rails db:migrate`

  `rails g administrate:install` # Generate admin dashboards

#### Spinning up the App
```
foreman start
```

#### Login as Admin in the app
* visit http://localhost:3000
* login as admin, user name: `jane@example.com`, password: `welcome`

###  About Saeloun

plate is maintained by [Saeloun Inc.](https://www.saeloun.com/)

We love open source software! See our other projects or hire us to design, develop, and grow your product.
