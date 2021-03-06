# frozen_string_literal: true

require 'spec_helper'

describe CXML::Request do
  it { should respond_to :punch_out_setup_request }
  it { should respond_to :id }
  it { should respond_to :deployment_mode }

  describe '#initialize' do
    it 'sets punch_out_setup_request attributes' do
      data = CXML::Parser.new(data: fixture('punch_out_setup_request_doc.xml')).parse
      doc = CXML::Document.new(data)
      doc.request.deployment_mode.should_not be_nil
      doc.request.punch_out_setup_request
         .should be_an_instance_of CXML::PunchOutSetupRequest
    end
    it 'sets purchase_order_request attributes' do
      data = CXML::Parser.new(data: fixture('purchase_order_request_200.xml')).parse
      doc = CXML::Document.new(data)
      doc.request.deployment_mode.should_not be_nil
      doc.request.order_request
         .should be_an_instance_of CXML::OrderRequest
    end
    it 'sets invoice_detail_request attributes' do
      data = CXML::Parser.new(data: fixture('invoice_taxes_at_line.xml')).parse
      doc = CXML::Document.new(data)
      doc.request.deployment_mode.should_not be_nil
      doc.request.invoice_detail_request
         .should be_an_instance_of CXML::InvoiceDetailRequest
    end
  end
end
