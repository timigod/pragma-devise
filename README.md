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
gem 'devise'
gem 'knock'
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

Next, you should configure [Devise](https://github.com/plataformatec/devise) and
[Knock](https://github.com/nsarno/knock), but skip the generation of any routes and controllers:
that's where Pragma::Devise comes in!

## Usage

To use the engine, simply mount it in your `routes.rb`:

```ruby
mount Pragma::Devise::Engine => '/'
```

Here are the routes provided by the engine:

```console
               tokens POST /tokens(.:format)                     pragma/devise/tokens#create
                users POST /users(.:format)                      pragma/devise/users#create
complete_confirmation POST /confirmations/:id/complete(.:format) pragma/devise/confirmations#complete
        confirmations POST /confirmations(.:format)              pragma/devise/confirmations#create
    complete_recovery POST /recoveries/:id/complete(.:format)    pragma/devise/recoveries#complete
           recoveries POST /recoveries(.:format)                 pragma/devise/recoveries#create
```

For more information on what each one does, you should have a look at the respective resources
and operations in [app/resources/pragma/devise](https://github.com/pragmarb/pragma-devise/tree/master/app/resources/pragma/devise).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pragmarb/pragma-devise.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
