# Order Up

### Dependencies

Before using Order Up, you'll need ruby (duh) and bundler. Install using `gem install bundler`.

To use the gem `capybara-webkit`, which we use for feature specs, you may need `qt` (see [these instructions](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit)). The issues with capybara are [documented here](https://github.com/thoughtbot/capybara-webkit#qt-dependency-and-installation-issues).

You also need a locally running `postgresql` database. We recommend installing postgresql/qt with [Homebrew](https://brew.sh/):

```
brew install postgres
brew install qt
```

### Installation

Once you have these basics, run:

```
git clone git@github.com:canes6288/Order_Up.git
cd Order_Up
bundle install
bundle exec rake db:create:all
bundle exec rake db:migrate
```

### Testing

We use `rspec` as a test framework. To run the suite, use:

```
bundle exec rspec
```

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
