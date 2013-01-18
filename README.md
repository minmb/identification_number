# IdentificationNumber

Validate person identification numbers (e.g. Social Security Numbers)

Currently, this gem supports the following person identification numbers:

 * Swedish personnummer
 * Swedish samordningsnummer

## Installation

Add this line to your application's Gemfile:

    gem 'identification_number'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install identification_number

## Usage

    require 'identification_number'

    IdentificationNumber::Personnummer.valid?('870706-2132')
    # => true
    
    pn = IdentificationNumber::Personnummer.new('870706-2132')
    # => 198707062132
    
    pn.long_format
    # => "198707062132"

    pn.short_format
    # => "870706-2132"

    pn.sex
    # => :male

    pn.male?
    # => true

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
