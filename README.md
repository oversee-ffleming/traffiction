# Traffiction

This command-line tool simply generates traffic for a specific URL.  It was
created for Oversee.net's QA team to simulate traffic in QA and staging
environments in order to test our concurrent-user-tracking functionality.

This is a simple wrapper - it's not intended for programmatic use, although
nothing's stopping anyone from using Traffiction as a regular old Ruby module.

## Installation

```
    $ gem install traffiction
```

## Usage

```
% traffiction
    -v, --verbose                    Verbose output
    -p, --port PORT                  Port
    -c, --count COUNT                Number of visits to perform
    -t, --threads THREADS            Number of threads to use
    -h, --help                       Display this screen
```

## Contributing

1. Fork it ( https://github.com/oversee-ffleming/traffiction/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Todo
* Tests
