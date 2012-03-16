# RilText

This is a thin wrapper of [Read It Later Text API](http://readitlaterlist.com/api/docs/).

At first, you should get [your API key](http://readitlaterlist.com/api/signup/).

## Installation

Add this line to your application's Gemfile:

    gem 'ril_text'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ril_text

## Usage

    require 'ril_text'
    RilText.get('http://readitlaterlist.com/api/docs')

will return a hash.  The hash contains following fields.

- `text`: Extracted body of the document.
- `title`: Title of the document.
- `resolved`: Resolved URL.  RIL Text API follows redirect chain until it gets 200.
- `image`: Favicon of the document.

## Coniguration

Set `apikey` using `RilText.configure` before use.

    RilText.configure do |c|
      c.apikey = 'yourapikey'
      c.images = 1
      c.mode = 'more'
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
