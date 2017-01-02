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

### Devise and Knock

Add these lines to your application's Gemfile:

```ruby
gem 'devise'
gem 'knock', github: 'alessandro1997/knock', branch: 'specific-rescue'
```

Next, follow the installation instructions for [Devise](https://github.com/plataformatec/devise) and
[Knock](https://github.com/nsarno/knock).

For Devise, make sure to skip the generation of any routes:

```ruby
devise_for :uers, skip: :all
```

**NOTE:** By default, Devise will try to link to your backend for the confirmation and password
reset pages. Since we have skipped the generation of all routes, this means that the mailers will
crash. What you should do instead is create your own mailer views (you can edit the ones generated
by `rails g devise:views`) and link to URLs on your frontend instead. These URLs will call the
backend and complete the user confirmation and password reset processes.

### Pragma::Devise

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

Now, to use the engine, simply mount it in your `routes.rb`:

```ruby
mount Pragma::Devise::Engine => '/'
```

By default, the gem will use `User` as the user model and `ApplicationController` as your base
controller. If those are not the right classes, you can change them by creating an initializer
(e.g. `config/initializers/pragma_devise.rb`):

```ruby
Pragma::Devise.configure do |config|
  config.user_model = '::AdminUser'
  config.base_controller = '::ApiController'
end
```

## Usage

After you have configured the gem, you can authenticate users by including `Pragma::Devise::Authenticable`
in your operations and installing the `#authenticate_user` before hook, which will try to
authenticate or respond with 401 Unauthorized and an error payload:

```ruby
module API
  module V1
    module Post
      module Operation
        class Create < Pragma::Operation::Create
          include Pragma::Devise::Authenticable
          before :authenticate_user
        end
      end
    end
  end
end
```

If you want to customize how you respond, you can make your own hook with the help of
`#current_user` (which is what `#authenticate_user` uses under the hood):

```ruby
module API
  module V1
    module Post
      module Operation
        class Create < Pragma::Operation::Create
          include Pragma::Devise::Authenticable
          before :custom_authenticate_user

          private

          def custom_authenticate_user
            head! :unauthorized unless current_user
          end
        end
      end
    end
  end
end
```

## Testing

Test helpers are provided to easily authenticate in tests. To use them, include
`Pragma::Devise::Test::Helper` in your RSpec configuration:

```ruby
RSpec.configure do |config|
  config.include Pragma::Devise::Test::Helper
end
```

Now you can use the `#authenticate_as` helper to authenticate in tests:

```ruby
RSpec.describe '/api/v1/posts' do
  let(:current_user) { create(:user) }
  before { authenticate_as current_user }

  # ...
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pragmarb/pragma-devise.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
