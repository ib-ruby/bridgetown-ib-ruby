# Bridgetown IB-Ruby  plugin

This plugin enables the interaction with the TWS-API of Interactive Brokers

## Installation


$ bundle add bridgetown-ib-ruby
```

Then add a file `tws.yml` to the config directory.

```
# TWS/Gateway
#
# Its assumed, that the TWS/IbGateway is running on localhost.
# Enter Port values 
#  4001/7696  for active accounts
#  4002/7697 for demo accounts
---
get_account_data:  true
serial_array: false
port: 4002
watchlists: 
 - :Spreads
 - :Stillhalter
 - :BuyAndHold 
:client_id: 2001

```


`IB::Gateway`-methods are present via `IB::Gateway.current`.
To rely on [ib-api](https://github.com/ib-ruby/ib-api) the `IB::Connection`-object is present via `IB::Connection.current`.  

## Limitations

Bridgetown depends on the outdated `terminal-table` Version 1.8. IB-Ruby uses features of 
the actual version in the `.as_table`-method. This is not available for now. Just use the 
fallback `.to_human`.


## Testing

The Gem is not released (jet).

To include the plugin, first clone this repository include it via `path` and    
modify `Gemfile`:
```
gem "bridgetown-ib-ruby", path: "../bridgetown-ib-ruby"
```

## Contributing

1. Fork it (https://github.com/bridgetownrb/bridgetown-activerecord/fork)
2. Clone the fork using `git clone` to your local development machine.
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
