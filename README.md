# EdoolsSdk
[![Build Status](https://travis-ci.org/lucasvmiguel/edools_sdk.svg?branch=master)](https://travis-ci.org/lucasvmiguel/edools_sdk)

This project is a SDK to Edools platform.

## Install

In your Gemfile:
```ruby
gem 'edools_sdk'
```

## Getting start 

You can set an enviroment variable called 'edools_token', or create a file 'config/edools.yml'(better if you are using rails)
```yml
token: 'some_token'
```
and then
```ruby
require 'edools_sdk'

EdoolsSdk::Course.all()
```

## Documentation

[here](http://www.rubydoc.info/gems/edools_sdk)

## License

[MIT](LICENSE)