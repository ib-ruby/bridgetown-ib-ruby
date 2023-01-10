# frozen_string_literal: true

require 'ib-gateway'
require 'ib/market-price'
require 'ib/option-chain'
require 'ib/eod'
require 'ib/symbols'

module BridgetownIbRuby

  def self.gateway_configuration(config)
    # Reads a YAML configuration file, evaluating any ERB, then parsing the resulting YAML.
    ActiveSupport::ConfigurationFile.parse(File.join(config.root_dir, "config", "tws.yml"))
  end

    #
  end
  def self.log_writer
    Bridgetown::LogWriter.new #.tap(&:enable_prefix)
  end

Bridgetown.initializer :"bridgetown-ib-ruby" do | config |
   IB::Gateway.new( **BridgetownIbRuby.gateway_configuration( config ) ) do |gw|
    # to do: subscribe to news , too
  gw.tws.subscribe( :Alert, :ManagedAccounts ){ | msg | gw.tws.logger.info  msg.to_human  }
  end
end
