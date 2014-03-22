# kalefinder

## setup

```
bundle install
rake db:migrate db:seed  #seed creates admin user and packages
```

## running

you need this route in your hosts for google maps api key
```
sudo echo "0.0.0.0 localhost.dev" >> /etc/hosts
```

```
rails s
```

open http://localhost.dev:3000

## dev notes

http://www.railsbricks.net/get-started

### Google Places Api Loader
```ruby
bundle exec rake google_places_loader:load[YOUR_API_KEY_HERE,/where/you/want/the/data.json]
```
