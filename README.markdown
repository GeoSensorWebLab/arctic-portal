# Arctic Connect User Portal

This app provides a centralized location to access all the Arctic Connect services.

## Requirements

* Ruby 2.4
* Rails 5.1.4

## Configuration

Configuration is managed through environment variables, as this app is deployable to cloud platforms like Heroku or Dokku.

## Database

Use `rake` to initialize the testing database:

```terminal
$ rake db:create db:migrate
```

## Deployment

Deployment is currently set up for an instance of [Dokku](https://github.com/progrium/dokku) running on the [Cybera Rapid Access Cloud](http://www.cybera.ca/projects/cloud-resources/rapid-access-cloud/). When deploying, you will need to configure the following environment variables:

```
ADMIN_PASS
HTTP Auth password for /admin/map_notes.

ADMIN_USER
HTTP Auth username for /admin/map_notes.

DATABASE_URL
URL to postgres database with username, password, host, port, and database name.

FACEBOOK_KEY
The App Id for the Facebook App configured for OAuth login.

FACEBOOK_SECRET
The App Secret for the Facebook App configured for OAuth login.

RACK_ENV
Environment for Rack. "production" is typical.

REDIS_NAMESPACE
Namespace for Redis cache. Should be unique.

REDIS_URL
URL to Redis instance. Can include username, password, host, database id.

SECRET_KEY_BASE
Key base for Rails session crypto.

TWITTER_KEY
The Twitter App Key for OAuth login.

TWITTER_SECRET
The Twitter App Secret for OAuth login.
```

It should be possible to deploy the application to Heroku because of Heroku's similarity to Dokku.

```terminal
$ git remote add dokku dokku@sarcee:arctic-portal
$ git push dokku master
```

And to update the virtual hosts:

```terminal
$ ssh dokku@sarcee domains:add arctic-portal portal.arcticconnect.ca arctic-portal.gswlab.ca portal.arcticconnect.org
```


## V8/The Ruby Racer Notes

It can be tricky to install the `libv8` and `therubyracer` gems, as they can fail if RubyGems or Bundler tries to use the system V8 instead of the one bundled with `libv8`. To solve this, try installing or updating using Bundler, which will fail due to compilation issues. Note down the versions of `libv8` and `therubyracer` that Bundler tried to install, and then install those gems manually:

```terminal
$ gem install libv8 -v 'VERSION'
$ gem install therubyracer -v 'VERSION'
```

Afterwards, Bundler will install or update gems correctly.

## License

MIT License

## Authors

James Badger <jpbadger@ucalgary.ca>
