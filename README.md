[![Circle CI](https://circleci.com/gh/vipulnsward/plate.png?style=badge)](https://circleci.com/gh/vipulnsward/plate)

### Demo

http://railstemplate.herokuapp.com

### Local Development Setup

Prerequisites:
- Install the latest [Node.js](https://nodejs.org) version. Make sure that [npm](https://www.npmjs.com/) is installed with it as well.
- Install [Ruby version 2.6.1](https://www.ruby-lang.org/en/news/2019/01/30/ruby-2-6-1-released/)

```
bundle install
bundle exec rake setup
bin/yarn
gem install foreman
foreman start -f Procfile.dev 
```
Visit http://localhost:3000 and login with email sam@example.com and password welcome.


### Replace Plate with your project name

Let's say that the project name is `Bottle`. Execute the command below to
replace all occurrences of `Plate` with `Bottle`.

```
perl -e "s/Plate/Bottle/g;" -pi $(find . -type f)
```

