[![Circle CI](https://circleci.com/gh/vipulnsward/plate.png?style=badge)](https://circleci.com/gh/vipulnsward/plate)

### Demo

http://railstemplate.herokuapp.com

### Local Development Setup

#### Prerequisites:
##### General Software Requirements
- Install the latest [Node.js](https://nodejs.org) version. Make sure that [npm](https://www.npmjs.com/) is installed with it as well.
- Install [yarn](https://yarnpkg.com/en/docs/install)
- Install [Ruby version 2.6.1](https://www.ruby-lang.org/en/news/2019/01/30/ruby-2-6-1-released/)
- Install [Postgres](https://postgresapp.com)
- Install [Redis](https://redis.io/download)
- Install [ImageMagick](https://imagemagick.org/script/download.php)

##### Installation steps on mac OS
- Install [Homebrew](https://brew.sh).
- Install the latest [Node.js](https://nodejs.org) version. Make sure that [npm](https://www.npmjs.com/) is installed with it as well.
- Install [RVM](https://rvm.io/rvm/install)
- Install Ruby 2.6.1 using RVM
  ```
  rvm install 2.6.1
  ```
  
  To make 2.6.1 as default and current version execute 
  ```
  rvm --default use 2.6.1
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

#### Bundle Install and Setup DB
```
bundle install
bundle exec rake setup 
```

#### Execute yarn and install foreman
```
bin/yarn
gem install foreman
```

#### Spinning up the App
```
foreman start -f Procfile.dev
```

#### Login as Admin in the app
* visit http://localhost:5000
* login as admin, user name: `sam@example.com`, password: `welcome`


### Replace Plate with your project name

Let's say that the project name is `Bottle`. Execute the command below to
replace all occurrences of `Plate` with `Bottle`.

```
perl -e "s/Plate/Bottle/g;" -pi $(find . -type f)
```
