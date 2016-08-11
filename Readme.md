# Simple CLI Tools

Because I am lazy

## Running Tests

```ruby
bundle install
bundle exec rake test
```

## Adding a Binary

```sh
touch bin/awesome_cmd
chmod +x bin/awesome_cmd
```

## Adding to Your Path

Run the init script:

```sh
./script/init
```

And follow the directions:

```
----------------------------------------------------------------------
Add the following to your shell profile of choice:

export PATH="$PATH:/home/josh/Programming/Ruby/simple-cl-tools/bin"
----------------------------------------------------------------------
```
