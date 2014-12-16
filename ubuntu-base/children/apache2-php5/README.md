Apache2-php5 Dockerfile for dev environment
===========================================

Apache php5 webserver
---------------------

### Configuration

Apache, php5, postfix, Xdebug, composer, phpunit, phing

Apache serve a phpinfo() page. To test it and obtain information about the configuration:
```
docker run -d -p 80:80 alexisno/apache2-php5
```
* `docker run ... alexisno/apache2-php5` Run Apache in a new container
* `-d` Detached mode: run container in the background
* `-p 80:80` Publish the container's port 80 on the host so you can connect to the sever

Open a brower at http://localhost/

Composer, phpunit and phing are available globally

Postfix has a simple configuration that just allows PHP to send mails.

Xdebug is configurated to accept any connection. Just send the appropriate request parameters.

### Common usage

This image should be used as a basic image for any project.
* Create an apache virtualhost for the development environment.
* Create a Dockerfile with your project dependencies and add the virtualhost to it's configuration.
* Create you own image with the `docker build` command. Do not forget to specify a tag.

Run your new image with a command similar to this:
```
docker run -d -p 80:80 -v /path/to/your/sources:/var/www/project-name -v /path/to/store/apache/logs:/var/log/apache2 your-image-tag
```


### Self signed certificate

The image comes with a script to generate self signed certificates in `/opt/gencert.sh`

Usage in child Dockerfile:
```
RUN /gencert.sh <domain>
```

Virtualhost configuration:
```
<VirtualHost *:443>
  SSLEngine on
  SSLCertificateFile /usr/local/apache/conf/<domain>.crt
  SSLCertificateKeyFile /usr/local/apache/conf/<domain>.key
  # SSL Protocol Adjustments:
  BrowserMatch "MSIE [2-6]" \
                  nokeepalive ssl-unclean-shutdown \
                  downgrade-1.0 force-response-1.0
  # MSIE 7 and newer should be able to use keepalive
  BrowserMatch "MSIE [17-9]" ssl-unclean-shutdown

  # Complete with your configuration
  ...

</VirtualHost>
```
Replace `<domain>` with your developement hostname.
