# Arctic Connect User Portal

This app provides a centralized location to access all the Arctic Connect services. It also provides a central authentication service that connects to SAML2 authentication providers.

It can be used for user access control or user tracking.

## Requirements

* Ruby 2.2
* Rails 4.2

## Configuration

Configuration is managed through environment variables, as this app is deployable to cloud platforms like Heroku or Dokku.

## Database

Use `rake` to initialize the testing database:

    $ rake db:create db:migrate

## Tests

No tests yet; will be rspec based when they are ready.

## Deployment

To be added later.

## License

Copyright GeoSensorWeb Lab 2015, All Rights Reserved.
