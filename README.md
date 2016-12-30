# Pragma::Devise

[![Build Status](https://img.shields.io/travis/pragmarb/pragma-devise.svg?maxAge=3600&style=flat-square)](https://travis-ci.org/pragmarb/pragma-devise)
[![Dependency Status](https://img.shields.io/gemnasium/pragmarb/pragma-devise.svg?maxAge=3600&style=flat-square)](https://gemnasium.com/github.com/pragmarb/pragma-devise)
[![Code Climate](https://img.shields.io/codeclimate/github/pragmarb/pragma-devise.svg?maxAge=3600&style=flat-square)](https://codeclimate.com/github/pragmarb/pragma-devise)
[![Coveralls](https://img.shields.io/coveralls/pragmarb/pragma-devise.svg?maxAge=3600&style=flat-square)](https://coveralls.io/github/pragmarb/pragma-devise)

Provides [Devise](https://github.com/plataformatec/devise) integration with
the [Pragma](https://github.com/pragmarb/pragma) architecture.

It gives you Pragma resources for Devise::Registerable, Devise::Confirmable and Devise::Recoverable.

It also adds [JWT](https://jwt.io) support to your application through the
[Knock](https://github.com/nsarno/knock) gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pragma-devise'
```

And then execute:

```console
$ bundle
```

Or install it yourself as:

```console
$ gem install pragma-devise
```

## Usage

To use the engine, simply mount it in your `routes.rb`:

```ruby
mount Pragma::Devise::Engine => '/'
```

Have a look at the [resources](https://github.com/pragmarb/pragma-devise/tree/master/app/resources/pragma/devise)
for more information on what we provide.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pragmarb/pragma-devise.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
