# frozen_string_literal: true

module CXML
  class ConfirmationStatus < DocumentNode
    accessible_attributes %i[
      quantity
      type
      shipment_date
      delivery_date
    ]
    accessible_nodes %i[
      comments
      unit_of_measure
      unit_price
      extrinsics
    ]

    def initialize_extrinsic(value)
      value = [value] unless value.is_a?(Array)
      @extrinsics = value.map do |item|
        Extrinsic.new(item)
      end
    end

    def initialize_extrinsics(value)
      value = [value] unless value.is_a?(Array)
      @extrinsics = value.map do |item|
        Extrinsic.new(item)
      end
    end
  end
end
