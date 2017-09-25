# EdoolsSdk
[![Build Status](https://travis-ci.org/lucasvmiguel/edools_sdk.svg?branch=master)](https://travis-ci.org/lucasvmiguel/edools_sdk)

This project is a SDK to Edools platform.

## Install

```ruby
gem 'edools_sdk', git: 'https://github.com/lucasvmiguel/edools_sdk.git'
```

## Getting start 

You need set an enviroment variable called 'edools_token', with a valid token, to work correctly with the edools platform!!!

```ruby
require 'edools_sdk'

EdoolsSdk::Course.all()
```

## Documentation

[here](doc)

## License

[MIT](LICENSE)