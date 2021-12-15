# Arctic Connect Portal

This app provides a centralized location to access all the Arctic Connect services.

## Requirements

Editing the site is currently done manually (using a text editor). [Bootstrap][] version 5 is available. To preview, open the page in your browser or use a one-liner script from your favourite scripting language.

[Bootstrap]: https://getbootstrap.com/

## Deployment

The GeoSensorWeb Lab at the University of Calgary is currently maintaining this application. We deploy it to a host that is running Dokku, and another server proxies requests to https://portal.arcticconnect.ca to this Dockerized application.


The Dokku configuration must be updated to include the `NGINX_ROOT=public` environment variable. This is deployed using Chef Infra, and developers should contact the GeoSensorWeb Lab for more information on updating this information.

If the application is already initialized on a Dokku host, the key can also be set manually:

```
$ sudo dokku config:set arctic-portal NGINX_ROOT=public
```

After setting the variable, pushing the code repository to Dokku will trigger a deploy using the static site generator. The new version of the website should be available in under a minute.

## Deployment (Future)

TODO: Convert to S3 + CloudFront deployment

## License

MIT License

## Authors

James Badger <jpbadger@ucalgary.ca>
