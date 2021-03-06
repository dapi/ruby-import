# ES7 style modules in Ruby.

[![Build Status](https://travis-ci.org/dapi/ruby-import.svg?branch=master)](https://travis-ci.org/dapi/ruby-import)

Use external module without mixins. No litter to global or local namespace.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-import'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-import

## Usage


### Import from file

You have defined module-package called `./utils.rb` somewhere in `$LOAD_PATH`:

```ruby
module ModuleNameDoesNotMetter
  def some_imported_method
    return 123
  end
end
```

In you application you have to import and use in-module defined methods:

```ruby

# Import find module and return a bunch of defined methods
Utils = import 'utils'

# Invoke imported method
Utils.some_imported_method()
# returns 123
```

### Import from module

This variant is good to use with autoload support frameworks like Ruby On Rails.

```ruby
module SomeUtils
  def some_imported_method
    return 123
  end
end
```

In you application you have to import and use in-module defined methods:

```ruby
# Import find module and return a bunch of defined methods
Utils = import SomeUtils

# Invoke imported method
Utils.some_imported_method()
# returns 123
```


## Other solutions

* https://github.com/dapi/module_import

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dapi/ruby-import. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ruby::Import project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/dapi/ruby-import/blob/master/CODE_OF_CONDUCT.md).
