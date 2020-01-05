Bunseki - simple website analytics
==============================

[![Go Report Card](https://goreportcard.com/badge/github.com/dannyvankooten/bunseki)](https://goreportcard.com/report/github.com/dannyvankooten/bunseki)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/dannyvankooten/bunseki/master/LICENSE)

[Bunseki](https://github.com/dannyvankooten/bunseki/) is a simpler and privacy-focused alternative to Google Analytics.

Collecting information on the internet is important, but it’s broken. We’ve become complacent in trading information for free access to web services, and then complaining when those web services do crappy things with that data.

The problem is this: _if we aren’t paying for the product, we are the product_.

Google Analytics may give you free access to their services but in turn, they’re assembling data profiles on your website visitors, which they can then use for better targeting of advertisements across their network.

We need to stop giving away our data and our users' privacy for free access to a tool.

Bunseki respects the privacy of your users and does not collect any personally identifiable information. All while giving you the information you need about your site, so you can make smarter decisions about your design and content.

![Screenshot of the Bunseki dashboard](https://github.com/dannyvankooten/bunseki/raw/master/assets/src/img/Bunseki.jpg?v=7)

## Installation

### Production

To install and run Bunseki in production, [see the installation instructions](docs/Installation%20instructions.md).

### Development

For getting a development version of Bunseki up & running, go through the following steps.

1. Ensure you have [Go](https://golang.org/doc/install#install) and [NPM](https://www.npmjs.com) installed
1. Download the code: `git clone https://github.com/dannyvankooten/bunseki.git $GOPATH/src/github.com/dannyvankooten/bunseki` 
1. Compile the project into an executable: `make build` 
1. (Optional) Set [custom configuration values](docs/Configuration.md)
1. (Optional) Register a user account: `./bunseki user add --email=<email> --password=<password>`
1. Start the webserver: `./bunseki server` and then visit **http://localhost:8080** to access your analytics dashboard

## Docker

### Building

Ensure you have Docker installed and run `docker build -t Bunseki .`.
Run the container with `docker run -d -p 8080:8080 Bunseki`.

## Tracking snippet

To start tracking, create a site in your Bunseki dashboard and copy the tracking snippet to the website(s) you want to track.

### Content Security Policy

If you use a [Content Security Policy (CSP)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP) to specify security policies for your website, Bunseki requires the following CSP directives (replace `your-bunseki-url.com` with the URL to your Bunseki instance):

```
script-src: your-bunseki-url.com;
img-src: your-bunseki-url.com;
```

## License

MIT licensed. 
