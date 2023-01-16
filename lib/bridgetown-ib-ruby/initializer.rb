# frozen_string_literal: true

require 'ib-gateway'
require 'ib/market-price'
require 'ib/option-chain'
require 'ib/eod'
require 'ib/symbols'

module BridgetownIbRuby

  def self.gateway_configuration(config)
    # Reads a YAML configuration file, evaluating any ERB, then parsing the resulting YAML.
    ActiveSupport::ConfigurationFile.parse(File.join(config.root_dir, "config", "tws.yml")).merge( logger: log_writer )
  end

  def self.the_gateway config
    IB::Gateway.new **BridgetownIbRuby.gateway_configuration(config) do |gw|
      gw.logger.level =  Logger::INFO
    end
  end

  def self.log_writer
    Bridgetown::LogWriter.new.tap(&:enable_prefix)
  end
end

Bridgetown.initializer :"bridgetown-ib-ruby" do | config |
   begin
     BridgetownIbRuby.the_gateway( config ) 
   rescue IB::TransmissionError, Errno::ECONNRESET => e
     puts "END Through Error"
   end
end
