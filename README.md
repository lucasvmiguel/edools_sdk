# EdoolsSdk
[![Build Status](https://travis-ci.org/lucasvmiguel/edools_sdk.svg?branch=master)](https://travis-ci.org/lucasvmiguel/edools_sdk)

This project is a SDK to Edools platform.

## Install

```ruby
gem 'edools_sdk', git: 'https://github.com/lucasvmiguel/edools_sdk.git'
```

## Getting start 

You can set an enviroment variable called 'edools_token', or create a file 'config/edools.yml'(better if you are using rails)
```yml
token: '32e3e8ce89205682adc1d3598e9bf75e:f2d9bd163eb42d92e81f164275f31c27'
```

You need set an enviroment variable called 'edools_token', with a valid token, to work correctly with the edools platform!!!

```ruby
require 'edools_sdk'

EdoolsSdk::Course.all()
```

## Documentation

[here](https://lucasvmiguel.github.io/)

## License

[MIT](LICENSE)