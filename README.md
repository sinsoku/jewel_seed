# JewelSeed

JewelSeed migrate seed files. It is efficient, quick, and best seed manager for Rails.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jewel_seed'
```

And then execute:

```bash
$ bundle install
```

After running `bundle install`, setup databases for JewelSeed:
```bash
$ rake jseed:install
```

## Usage

### Basic Usage

Run the JewelSeed generator to add seed file:
```bash
$ rails g jseed InitUser
```

Then edit generated seed file, and migrate:
```bash
$ rake jseed:migrate
```

### Dump seeds & Load seeds

Create `db/seeds/*.rb` files:
```bash
$ rake jseed:dump
```

And load seed files in `db/seeds/*.rb`:
```bash
$ rake jseed:load
```

### Rollback

Rollback seed data:
```
$ rake jseed:rollback
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
