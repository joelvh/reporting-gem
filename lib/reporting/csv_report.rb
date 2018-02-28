module Reporting
  class CsvReport < Job
    def initialize
    end

    setup do |context|
    end

    source do |context|
      shipment = context[:shipment]
      shipment.shipment_entries.includes(subscription: {order: {ship_address: :state}})
    end

    flatten
    explode
    symbolize_keys

    transform do |row, context|
    end

    destination do |context|
    end

    finalize do |context|
    end
  end
end
