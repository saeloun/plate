[![Circle CI](https://circleci.com/gh/vipulnsward/plate.png?style=badge)](https://circleci.com/gh/vipulnsward/plate)

### Demo

http://railstemplate.herokuapp.com

### Local Development Setup

#### Prerequisites:
- Install [Homebrew](https://brew.sh).
- Install the latest [Node.js](https://nodejs.org) version. Make sure that [npm](https://www.npmjs.com/) is installed with it as well.
- Install [Ruby version 2.6.1](https://www.ruby-lang.org/en/news/2019/01/30/ruby-2-6-1-released/)
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
* visit http://localhost:3000
* login as admin, user name: `sam@example.com`, password: `welcome`


### Replace Plate with your project name

Let's say that the project name is `Bottle`. Execute the command below to
replace all occurrences of `Plate` with `Bottle`.

```
perl -e "s/Plate/Bottle/g;" -pi $(find . -type f)
```
